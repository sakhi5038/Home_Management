import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project_home_manager/pages/login_page/view/login_page.dart';
import 'package:flutter_project_home_manager/utils/shared_prefernces_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final signupPageProvider =
    NotifierProvider<SignUpPageController, void>(SignUpPageController.new);

class SignUpPageController extends Notifier<void> {
  // GlobalKey<FormState> signupFromKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordHintController = TextEditingController();
  SharedPreferences? sharedPreferences;
  @override
  void build() {
    // ref.onDispose(usernameController.dispose);
    // ref.onDispose(passwordController.dispose);
    // ref.onDispose(passwordHintController.dispose);
  }

  addUserOnClick(var context) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences?.setString(
        SharedPreferencesConstant.kSharedPreferenceUsernameKey,
        usernameController.text.trim());
    sharedPreferences?.setString(
        SharedPreferencesConstant.kSharedPreferencePasswordKey,
        passwordController.text.trim());
    sharedPreferences?.setString(
        SharedPreferencesConstant.kSharedPreferencePasswordHintKey,
        passwordHintController.text.trim());
    sharedPreferences?.setBool(
        SharedPreferencesConstant.kAccountCreatedButLogout, true);
    log('user signed in : ${usernameController.text}');
    log('user signed in : ${passwordController.text}');
    log('user signed in : ${passwordHintController.text}');
    usernameController.clear();
    passwordController.clear();
    passwordHintController.clear();
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(seconds: 2),
        reverseTransitionDuration: const Duration(seconds: 2),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const LoginPage();
        },
      ),
    );
  }
}
