import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/common_app_widgets/common_text_field.dart';
import 'package:flutter_project_home_manager/pages/overview_page/controller/overview_page_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalBudgetTextField extends ConsumerWidget {
  const TotalBudgetTextField({super.key});

  static const fieldHint = 'Total Budget';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var Size(:width) = MediaQuery.sizeOf(context);
    return AppCommonField(
        width: width * 0.8,
        prefixIcon: Icons.attach_money,
        borderRadius: width * 0.04,
        controller: ref.read(overviewPageProvider.notifier).textController,
        inputTextColor: Colors.blue,
        textType: TextInputType.number,
        label: fieldHint);
  }
}
