import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/common_app_widgets/common_text_field.dart';
import 'package:flutter_project_home_manager/pages/profile_page/controller/profile_page_controller.dart';
import 'package:flutter_project_home_manager/utils/shared_prefernces_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordResetInputField extends ConsumerWidget {
  const PasswordResetInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var Size(:width) = MediaQuery.sizeOf(context);
    var controller = ref.read(profilePageProvider.notifier);
    String? password = GetIt.I<SharedPreferences>()
        .getString(SharedPreferencesConstant.kSharedPreferencePasswordKey);
    return AppCommonField(
        iconColor: Colors.white,
        inputTextColor: Colors.white,
        textColor: Colors.white,
        prefixIcon: Icons.lock_outline_rounded,
        width: width * 0.8,
        borderRadius: width * 0.05,
        controller: controller.resetPasswordController,
        validator: (value) {
          return (value == null || value == '')
              ? 'required fields are empty'
              : (value == password)
                  ? 'enter different password'
                  : null;
        },
        label: 'New Password');
  }
}
