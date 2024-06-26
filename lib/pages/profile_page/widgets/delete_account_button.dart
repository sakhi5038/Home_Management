import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/common_app_widgets/common_button.dart';
import 'package:flutter_project_home_manager/pages/profile_page/controller/profile_page_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// delete account button
class DeleteAccountButton extends ConsumerWidget {
  const DeleteAccountButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.read(profilePageProvider.notifier);
    var Size(:width) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.all(width * 0.01),
      child: SizedBox(
        height: width * 0.15,
        child: AppCommonButton(
          backgroundColor: Colors.red.shade900,
          buttonIcon: Icons.delete,
          buttonText: 'Delete Account',
          width: width * 0.7,
          onClick: () {
            controller.deleteAccoutOnClick(context);
          },
        ),
      ),
    );
  }
}

// dialog on delete account button press
class DeleteAccountDialog extends ConsumerWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var Size(
      :width,
    ) = MediaQuery.sizeOf(context);
    var controller = ref.read(profilePageProvider.notifier);
    return PopScope(
      canPop: false,
      child: Center(
        child: SizedBox(
          width: width * 0.9,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(width * 0.1)),
            child: Padding(
              padding: EdgeInsets.all(width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'All your information and data will be permanently erased !',
                    style:
                        TextStyle(color: Colors.black, fontSize: width * 0.05),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.blue),
                          )),
                      TextButton(
                          onPressed: () {
                            controller.deleteDialogButton(context);
                          },
                          child: const Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
