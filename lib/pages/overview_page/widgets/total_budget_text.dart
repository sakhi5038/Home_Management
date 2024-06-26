import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/overview_page/controller/overview_page_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalBudgetText extends ConsumerWidget {
  const TotalBudgetText({super.key, required this.totalBudget});
  final num totalBudget;
  static const totalBudgetText = 'Total Budget : ';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(overviewPageProvider.notifier);
    var Size(:width, :height) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(top: width * 0.05, bottom: width * 0.01),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: totalBudgetText,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: height * 0.035,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: controller.totalBudgetText.toString(),
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'California',
                fontSize: height * 0.04,
              ),
            )
          ],
        ),
      ),
    );
  }
}
