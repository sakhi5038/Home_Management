import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/overview_page/controller/overview_page_state.dart';
import 'package:flutter_project_home_manager/services/database_services/local_db.dart';
import 'package:flutter_project_home_manager/utils/shared_prefernces_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final overviewPageProvider =
    NotifierProvider<OverviewPageController, OverviewPageStates>(
        OverviewPageController.new);

class OverviewPageController extends Notifier<OverviewPageStates> {
  static const _errorMessage = 'Error Calculating Budget';
  num totalBudgetText = 0;
  num groceryExpenseText = 0;
  num utilityBillsExpenseText = 0;
  num remainingBalanceText = 0;
  final LocalDB _db = LocalDB();
  final TextEditingController textController = TextEditingController();

  @override
  OverviewPageStates build() {
    ref.onDispose(
      () {
        textController.dispose();
      },
    );
    return OverviewPageInitialState();
  }

  void saveTotalBudget() {
    var preferences = GetIt.I<SharedPreferences>();
    preferences.setDouble(SharedPreferencesConstant.kTotalBudget,
        double.tryParse(textController.text) ?? 0.0);
    textController.clear();
    FocusManager.instance.primaryFocus!.unfocus();
    // update the Ui with new budget
    getExpenses();
  }

  // get total grocery expenses
  Future<double> _getTotalGroceryExpense() async {
    var groceriesExpense = 0.0;
    try {
      var listOfGroceries = await _db.groceries();
      for (var element in listOfGroceries) {
        groceriesExpense += (element.itemPrice * element.totalQuantity);
      }
    } catch (e) {
      state = const OverviewPageErrorState(errorMessage: _errorMessage);
      log(e.toString());
    }
    return groceriesExpense;
  }

// get total utilities expenses
  Future<double> _getTotalUtlityBillsExpense() async {
    var utilitiesExpense = 0.0;
    try {
      var listOfBills = await _db.utilites();
      for (var element in listOfBills) {
        utilitiesExpense += element.paidAmount;
      }
    } catch (e) {
      state = const OverviewPageErrorState(errorMessage: _errorMessage);
      log(e.toString());
    }
    return utilitiesExpense;
  }

  // update the overviewpage through this fucntion
  void getExpenses() async {
    state = OverviewPageLoadingState();
    try {
      var prefrences = GetIt.I<SharedPreferences>();
      totalBudgetText =
          prefrences.getDouble(SharedPreferencesConstant.kTotalBudget) ?? 0;
      groceryExpenseText = await _getTotalGroceryExpense();
      utilityBillsExpenseText = await _getTotalUtlityBillsExpense();
      remainingBalanceText =
          totalBudgetText - (groceryExpenseText + utilityBillsExpenseText);
      state = OverViewPageLoadedState(
          totalBudget: totalBudgetText,
          groceryExpense: groceryExpenseText,
          utilitiesExpense: utilityBillsExpenseText,
          remainingBudget: remainingBalanceText);
    } catch (e) {
      state = const OverviewPageErrorState(errorMessage: _errorMessage);
      log(e.toString());
    }
  }
}
