import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/common_app_widgets/common_text_field.dart';
import 'package:flutter_project_home_manager/pages/profile_page/controller/profile_page_controller.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordKeyResetInputField extends ConsumerWidget {
  const PasswordKeyResetInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var Size(:width) = MediaQuery.sizeOf(context);
    var controller = ref.read(profilePageProvider.notifier);
    return AppCommonField(
        iconColor: Colors.white,
        inputTextColor: Colors.white,
        textColor: Colors.white,
        prefixIcon: Icons.help_outline,
        width: width * 0.8,
        borderRadius: width * 0.05,
        controller: controller.resetPasswordHintController,
        validator: (value) {
          return (value == null || value == '')
              ? 'required fields are empty'
              : null;
        },
        label: 'Password Hint');
  }
}
