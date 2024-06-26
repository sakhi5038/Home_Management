import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/overview_page/widgets/bills_expenses_text.dart';
import 'package:flutter_project_home_manager/pages/overview_page/widgets/grocery_expenses_text.dart';
import 'package:flutter_project_home_manager/pages/overview_page/widgets/remaining_balance_text.dart';
import 'package:flutter_project_home_manager/pages/overview_page/widgets/total_budget_text.dart';
import 'package:flutter_project_home_manager/pages/overview_page/widgets/total_budget_text_field.dart';
import 'package:flutter_project_home_manager/pages/overview_page/widgets/udpate_budget_button.dart';

class OverViewInfo extends StatelessWidget {
  const OverViewInfo(
      {super.key,
      required this.totalBudget,
      required this.groceryExpense,
      required this.utitlityexpnese,
      required this.remainingBudget});
  final num totalBudget, groceryExpense, utitlityexpnese, remainingBudget;

  @override
  Widget build(BuildContext context) {
    final Size(:height) = MediaQuery.sizeOf(context);
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/view_image.jpg'),
            fit: BoxFit.fill,
            opacity: 0.7),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const TotalBudgetTextField(),
            TotalBudgetText(
              totalBudget: totalBudget,
            ),
            GroceryExpensesText(
              groceryExpense: groceryExpense,
            ),
            BillsExpensesText(
              utitliyExpense: utitlityexpnese,
            ),
            RemainingBalanceText(
              remianingBudget: remainingBudget,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            const UpdateBudgetButton(),
          ],
        ),
      ),
    );
  }
}
