import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/common_app_widgets/common_button.dart';
import 'package:flutter_project_home_manager/pages/profile_page/controller/profile_page_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.read(profilePageProvider.notifier);
    var Size(:width) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.all(width * 0.01),
      child: SizedBox(
        height: width * 0.15,
        child: AppCommonButton(
          backgroundColor: Colors.red,
          buttonIcon: Icons.logout,
          buttonText: 'Logout',
          width: width * 0.7,
          onClick: () {
            controller.logoutClick(context);
          },
        ),
      ),
    );
  }
}
