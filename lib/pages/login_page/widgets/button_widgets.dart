import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/common_app_widgets/common_button.dart';
import 'package:flutter_project_home_manager/pages/login_page/controller/login_page_controller.dart';
import 'package:flutter_project_home_manager/utils/shared_prefernces_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginButton extends ConsumerWidget {
  final GlobalKey<FormState> formkey;
  const LoginButton({super.key , 
  required this.formkey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.read(loginPageProvider.notifier);
    final size = MediaQuery.sizeOf(context);

    onClick() {
      if(formkey.currentState?.validate() ?? false){
        GetIt.I<SharedPreferences>()
          .setBool(SharedPreferencesConstant.kAccountCreatedButLogout, false);
      controller.loginButtonOnClick(context);
      }
    }

    return AppCommonButton(
        width: size.width * 0.7,
        backgroundColor: Colors.blue,
        buttonText: 'Login',
        onClick: onClick,
        buttonIcon: Icons.login);
  }
}
