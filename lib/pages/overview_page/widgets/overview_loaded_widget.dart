import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_project_home_manager/pages/overview_page/controller/overview_page_controller.dart';
import 'package:flutter_project_home_manager/pages/overview_page/controller/overview_page_state.dart';
import 'package:flutter_project_home_manager/pages/overview_page/widgets/overview_expenses_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverViewWidget extends ConsumerWidget {
  const OverViewWidget({
    super.key,
  });
  static const scaffoldMessangerText = 'Please Enter Your Budget';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(overviewPageProvider.notifier);
    final state = ref.watch(overviewPageProvider);
    final (
      prevTotalBudget,
      prevGroceryExpense,
      preUtilityExpense,
      prevRemainingBudget
    ) = (
      controller.totalBudgetText,
      controller.groceryExpenseText,
      controller.utilityBillsExpenseText,
      controller.remainingBalanceText
    );
    return Stack(
      alignment: Alignment.center,
      children: [
        Builder(
          builder: (context) {
            if (state is OverviewPageInitialState) {
              return const CupertinoActivityIndicator();
            } else if (state is OverviewPageLoadingState) {
              // show previous values
              return OverViewInfo(
                totalBudget: prevTotalBudget,
                groceryExpense: prevGroceryExpense,
                utitlityexpnese: preUtilityExpense,
                remainingBudget: prevRemainingBudget,
              );
            } else if (state is OverViewPageLoadedState) {
              //show updated values
              return OverViewInfo(
                totalBudget: state.totalBudget,
                groceryExpense: state.groceryExpense,
                utitlityexpnese: state.utilitiesExpense,
                remainingBudget: state.remainingBudget,
              );
            } else {
              SchedulerBinding.instance.addPostFrameCallback(
                (timeStamp) {
                  ScaffoldMessenger.of(context)
                    ..clearSnackBars()
                    ..showSnackBar(
                      SnackBar(
                          content: const Text(
                            scaffoldMessangerText,
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.blue.shade400),
                    );
                },
              );
              //show previous values and a SnackBar
              return OverViewInfo(
                totalBudget: prevTotalBudget,
                groceryExpense: prevGroceryExpense,
                utitlityexpnese: preUtilityExpense,
                remainingBudget: prevRemainingBudget,
              );
            }
          },
        ),
        const OverviewPageLoadingWidget(),
      ],
    );
  }
}

class OverviewPageLoadingWidget extends ConsumerWidget {
  const OverviewPageLoadingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(overviewPageProvider);
    if (state is OverviewPageLoadingState) {
      return const CupertinoActivityIndicator();
    } else {
      return const SizedBox();
    }
  }
}
