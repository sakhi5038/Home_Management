import 'dart:developer';
import 'package:flutter_project_home_manager/services/notification_services/local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/home_page/view/home_page.dart';

import 'package:flutter_project_home_manager/pages/login_page/view/login_page.dart';
import 'package:flutter_project_home_manager/navigation/generate_route.dart';

import 'package:flutter_project_home_manager/pages/signup_page/view/signup_page.dart';
import 'package:flutter_project_home_manager/utils/shared_prefernces_constants.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications().initialize();
  tz.initializeTimeZones();
  log('initial widget binding initialized');
  GetIt.I.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

 
  log('shared preferences insatnce initialized');
  SharedPreferences shared = GetIt.I<SharedPreferences>();

  bool loginPageCondition = shared.containsKey(
        SharedPreferencesConstant.kSharedPreferenceUsernameKey,
      ) &&
      shared.containsKey(SharedPreferencesConstant.kAccountCreatedButLogout) &&
      shared.getBool(SharedPreferencesConstant.kAccountCreatedButLogout) ==
          true;

  bool homePageCondition = shared.containsKey(
        SharedPreferencesConstant.kSharedPreferenceUsernameKey,
      ) &&
      shared.containsKey(
          SharedPreferencesConstant.kSharedPreferencePasswordKey) &&
      shared.containsKey(SharedPreferencesConstant.kAccountCreatedButLogout) &&
      shared.getBool(SharedPreferencesConstant.kAccountCreatedButLogout) ==
          false;
  log('shared preferences already used : $loginPageCondition');
  String initialRoute;
  if (loginPageCondition) {
    initialRoute = LoginPage.pageAddress;
    log('login page initialized');
  } else if (homePageCondition) {
    initialRoute = HomePage.pageAddress;
    log('sign up page initialized');
  } else {
    initialRoute = SignupPage.pageAddress;
  }  
  runApp(ProviderScope(child: MyApp(initialRoute: initialRoute)));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/images/whiteTexturedBackground.jpg'), context);
    return MaterialApp(
      title: 'Home Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
