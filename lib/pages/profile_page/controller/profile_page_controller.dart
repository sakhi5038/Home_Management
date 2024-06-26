// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_project_home_manager/pages/login_page/view/login_page.dart';

import 'package:flutter_project_home_manager/pages/profile_page/controller/profile_page_state.dart';
import 'package:flutter_project_home_manager/pages/profile_page/widgets/delete_account_button.dart';
import 'package:flutter_project_home_manager/pages/signup_page/view/signup_page.dart';
import 'package:flutter_project_home_manager/services/database_services/local_db.dart';
import 'package:flutter_project_home_manager/utils/shared_prefernces_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final profilePageProvider =
    NotifierProvider<ProfilePageController, ProfilePageState>(
        ProfilePageController.new);

class ProfilePageController extends Notifier<ProfilePageState> {
  static const passwordUpdated = 'Password updated';
  static const accountLogedOut = 'Account loged out';
  // GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  TextEditingController resetPasswordController = TextEditingController();
  TextEditingController resetPasswordHintController = TextEditingController();
  var sharedPreferences = GetIt.I<SharedPreferences>();
  final LocalDB _db = LocalDB();
  @override
  ProfilePageState build() {
    return ProfilePageInitialState();
  }

  onUpdatePasswordButton(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      // if (passwordFormKey.currentState!.validate()) {
      log('password updated');
      sharedPreferences.setString(
          SharedPreferencesConstant.kSharedPreferencePasswordKey,
          resetPasswordController.text.trim());

      sharedPreferences.setString(
          SharedPreferencesConstant.kSharedPreferencePasswordHintKey,
          resetPasswordHintController.text.trim());
      resetPasswordController.text = '';
      resetPasswordHintController.text = '';
      FocusManager.instance.primaryFocus!.unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
              passwordUpdated,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue),
      );
      // } else {
      //   log('password not updated');
      // }
    });
  }

  logoutClick(BuildContext context) {
    GetIt.I<SharedPreferences>()
        .setBool(SharedPreferencesConstant.kAccountCreatedButLogout, true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text(
            accountLogedOut,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red),
    );
    log('user logged out');
    Navigator.pushReplacementNamed(context, LoginPage.pageAddress);
  }

  deleteAccoutOnClick(BuildContext context) {
    log('delete account dialog clicked');
    showDialog(
      context: context,
      builder: (context) => const DeleteAccountDialog(),
    );
  }

  deleteDialogButton(BuildContext context) async {
    GetIt.I<SharedPreferences>()
        .remove(SharedPreferencesConstant.kSharedPreferenceUsernameKey);
    GetIt.I<SharedPreferences>()
        .remove(SharedPreferencesConstant.kSharedPreferencePasswordKey);
    GetIt.I<SharedPreferences>()
        .remove(SharedPreferencesConstant.kSharedPreferencePasswordHintKey);
    GetIt.I<SharedPreferences>()
        .remove(SharedPreferencesConstant.kAccountCreatedButLogout);
    GetIt.I<SharedPreferences>().remove(SharedPreferencesConstant.kTotalBudget);
    resetPasswordController.clear();
    resetPasswordHintController.clear();
    //delete all data from tables
    if (await _db.deleteAllGroceries() && await _db.deleteAllUtitlities()) {
      log('user is deleted');
      Navigator.popAndPushNamed(context, SignupPage.pageAddress);
    } else {
      log('user not deleted');
    }
  }
}
