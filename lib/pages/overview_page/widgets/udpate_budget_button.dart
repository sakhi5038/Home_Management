import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/common_app_widgets/common_button.dart';
import 'package:flutter_project_home_manager/pages/overview_page/controller/overview_page_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateBudgetButton extends ConsumerWidget {
  const UpdateBudgetButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var Size(:width) = MediaQuery.sizeOf(context);
    var controller = ref.read(overviewPageProvider.notifier);
    return AppCommonButton(
        width: width * 0.8,
        backgroundColor: Colors.blueAccent.shade400,
        buttonText: 'update budget',
        onClick: () {
          controller.saveTotalBudget();
        },
        buttonIcon: Icons.upload_sharp);
  }
}
