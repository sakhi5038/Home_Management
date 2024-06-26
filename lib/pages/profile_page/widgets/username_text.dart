import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/utils/shared_prefernces_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsernameTextProfilePage extends StatelessWidget {
  const UsernameTextProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    String username = GetIt.I<SharedPreferences>()
        .getString(SharedPreferencesConstant.kSharedPreferenceUsernameKey) ?? '';
    return Padding(
      padding: EdgeInsets.all(width * 0.05),
      child: RichText(
          text: TextSpan(
        children: [
          TextSpan(
            text: 'Hi, ',
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.1,
            ),
          ),
          TextSpan(
            text: username,
            style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.1,
                fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
