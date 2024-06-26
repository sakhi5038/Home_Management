import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/common_app_widgets/common_button.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/controller/utility_page_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateItemDialogButton extends ConsumerWidget {
  final BuildContext dialogContext;

  const UpdateItemDialogButton({super.key, required this.dialogContext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var Size(:width) = MediaQuery.sizeOf(context);
    var controller = ref.read(utilityPageProvider.notifier);
    return FittedBox(
      child: AppCommonButton(
        backgroundColor: Colors.blueAccent,
        buttonIcon: Icons.add,
        buttonText: 'Bill Updated',
        width: width * 0.5,
        onClick: () {
          controller.listItemUpdateDialogSubmitButtonClick(context);
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(
              const SnackBar(
                  content: Text(
                    'bill updated',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.blue),
            );
        },
      ),
    );
  }
}
