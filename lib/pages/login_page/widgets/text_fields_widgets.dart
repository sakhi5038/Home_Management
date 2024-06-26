import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/common_app_widgets/common_text_field.dart';
import 'package:flutter_project_home_manager/pages/login_page/controller/login_page_controller.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsernameTextFormField extends ConsumerWidget {
  const UsernameTextFormField({super.key});

  static const textFieldLabel = 'Username';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final controller = ref.read(loginPageProvider.notifier);
    return AppCommonField(
      prefixIcon: Icons.person,
      width: size.width * 0.8,
      borderRadius: size.width * 0.06,
      controller: controller.usernameController,
      label: textFieldLabel,
      validator: controller.validatorForUsernameField,
    );
  }
}

class PasswordTextFormField extends ConsumerWidget {
  const PasswordTextFormField({super.key});
  static const textFieldLabel = 'Password';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final controller = ref.read(loginPageProvider.notifier);
    return AppCommonField(
      width: size.width * 0.8,
      borderRadius: size.width * 0.06,
      controller: controller.passwordController,
      prefixIcon: Icons.lock,
      label: textFieldLabel,
      validator: controller.validatorForPasswordField,
    );
  }
}
