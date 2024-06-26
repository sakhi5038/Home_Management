import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/common_app_widgets/common_button.dart';
import 'package:flutter_project_home_manager/pages/signup_page/controller/signup_page_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToLoginScreenButton extends ConsumerWidget {
  final GlobalKey<FormState> validationKey;
  const ToLoginScreenButton({super.key , required this.validationKey,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    onClick() {
      if(validationKey.currentState?.validate() ?? false){
        ref.read(signupPageProvider.notifier).addUserOnClick(context);
      }
    }

    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: size.width * 0.18,
      child: AppCommonButton(
          width: size.width * 0.7,
          backgroundColor: Colors.blue,
          buttonText: 'Add User',
          onClick: onClick,
          buttonIcon: Icons.add_box_outlined),
    );
  }
}
