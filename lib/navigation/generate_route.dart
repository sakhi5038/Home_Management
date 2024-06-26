import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/home_page/view/home_page.dart';
import 'package:flutter_project_home_manager/pages/error_page/error_page.dart';

import 'package:flutter_project_home_manager/pages/login_page/view/login_page.dart';
import 'package:flutter_project_home_manager/pages/profile_page/view/profile_page.dart';
import 'package:flutter_project_home_manager/pages/signup_page/view/signup_page.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/view/utilities_page.dart';

Route? onGenerateRoute(RouteSettings settings) {
  return switch (settings.name) {
    SignupPage.pageAddress => appPageBuilder(const SignupPage()),
    LoginPage.pageAddress => appPageBuilder(const LoginPage()),
    HomePage.pageAddress => appPageBuilder(const HomePage()),
    UtilityPage.pageAddress => appPageBuilder(const UtilityPage()),
    ErrorPage.pageAddress => appPageBuilder(const ErrorPage()),
    ProfilePage.pageAddress => appPageBuilder(const ProfilePage()),
    _ => appPageBuilder(const ErrorPage()),
  };
}

PageRouteBuilder appPageBuilder(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return AnimatedOpacity(
          curve: Curves.bounceInOut,
          opacity: animation.value,
          duration: const Duration(seconds: 1),
          child: page);
    },
  );
}
