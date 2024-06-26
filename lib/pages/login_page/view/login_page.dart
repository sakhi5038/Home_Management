import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/login_page/controller/login_page_controller.dart';
import 'package:flutter_project_home_manager/pages/login_page/widgets/button_widgets.dart';
import 'package:flutter_project_home_manager/pages/login_page/widgets/text_fields_widgets.dart';
import 'package:flutter_project_home_manager/pages/login_page/widgets/title_image_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});
  static const pageAddress = '/loginPage';

  @override
  ConsumerState<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>(debugLabel: 'login');

  @override
  void dispose() {
    log('[Called]');    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.read(loginPageProvider.notifier);
    final Size(:height, :width) = MediaQuery.sizeOf(context);
    return Scaffold(
      key: UniqueKey(),
      body: DecoratedBox(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login_image.jpg'),
                fit: BoxFit.cover,
                opacity: 0.4)),
        child: Center(
          child: Form(
            key: formKey,
            child: SizedBox(
              height: height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 12, child: TitleIconWidget(width: width * 0.4)),
                  const Spacer(),
                  const Expanded(flex: 7, child: UsernameTextFormField()),
                  const Spacer(),
                  const Expanded(flex: 7, child: PasswordTextFormField()),
                  const Spacer(),
                  Expanded(
                      flex: 4,
                      child: LoginButton(
                          formkey: formKey,
                          )),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
