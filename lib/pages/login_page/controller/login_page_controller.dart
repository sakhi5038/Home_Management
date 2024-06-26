import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/home_page/view/home_page.dart';
import 'package:flutter_project_home_manager/pages/login_page/controller/login_page_states.dart';
import 'package:flutter_project_home_manager/utils/shared_prefernces_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final loginPageProvider =
    NotifierProvider.autoDispose<LoginPageController, LoginPageState>(
        LoginPageController.new);

class LoginPageController extends AutoDisposeNotifier<LoginPageState> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // authentic username and password
  SharedPreferences sharedData = GetIt.I<SharedPreferences>();
  String? username, password;

  // login button on click function
  loginButtonOnClick(BuildContext context) {
    log('log in button clicked');

    log('form get validated');
    sharedData.setBool(
        SharedPreferencesConstant.kAccountCreatedButLogout, false);
    sharedData.setString(SharedPreferencesConstant.kSharedPreferenceUsernameKey,
        usernameController.text.trim());
    usernameController.text = '';
    passwordController.text = '';
    log('prefrences values updated');
    Navigator.pushNamed(context, HomePage.pageAddress);
  }

  // validator for username field
  String? validatorForUsernameField(String? value) {
    // username = sharedData
    //     .getString(SharedPreferencesConstant.kSharedPreferenceUsernameKey);
    if (value == '' && value == null) {
      return 'Required field is empty';
    } else if (username != value) {
      return 'user not exists';
    }
    return null;
  }

  String? validatorForPasswordField(String? value) {
    // username = sharedData
    //     .getString(SharedPreferencesConstant.kSharedPreferenceUsernameKey);
    // password = sharedData
    //     .getString(SharedPreferencesConstant.kSharedPreferencePasswordKey);
    var passwordHint = sharedData
        .getString(SharedPreferencesConstant.kSharedPreferencePasswordHintKey);
    if (username == null) {
      return '';
    } else if (value == null && value == '') {
      return 'field is empty';
    } else if (value != password) {
      return 'password is not correct, hint : $passwordHint';
    } else {
      return null;
    }
  }

  @override
  LoginPageState build() {
    username = sharedData
        .getString(SharedPreferencesConstant.kSharedPreferenceUsernameKey);
    password = sharedData
        .getString(SharedPreferencesConstant.kSharedPreferencePasswordKey);
    return LoginPageInitialState();
  }
}
