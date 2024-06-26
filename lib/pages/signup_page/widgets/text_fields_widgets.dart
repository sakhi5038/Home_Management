import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/common_app_widgets/common_text_field.dart';
import 'package:flutter_project_home_manager/pages/signup_page/controller/signup_page_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsernameFieldSignup extends ConsumerWidget {
  const UsernameFieldSignup({super.key});

  static const textFieldLabel = 'Username';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final controller = ref.read(signupPageProvider.notifier);
    return AppCommonField(
        prefixIcon: Icons.person,
        width: size.width * 0.8,
        borderRadius: size.width * 0.06,
        controller: controller.usernameController,
        label: textFieldLabel);
  }
}

class PasswordFieldSignup extends ConsumerWidget {
  const PasswordFieldSignup({super.key});

  static const textFieldLabel = 'Password';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final controller = ref.read(signupPageProvider.notifier);
    return AppCommonField(
        prefixIcon: Icons.lock,
        width: size.width * 0.8,
        borderRadius: size.width * 0.06,
        controller: controller.passwordController,
        label: textFieldLabel);
  }
}

class PasswordHintFieldSignup extends ConsumerWidget {
  const PasswordHintFieldSignup({super.key});

  static const textFieldLabel = 'Password Hint';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final controller = ref.read(signupPageProvider.notifier);
    return AppCommonField(
        prefixIcon: Icons.question_mark,
        width: size.width * 0.8,
        borderRadius: size.width * 0.06,
        controller: controller.passwordHintController,
        label: textFieldLabel);
  }
}
