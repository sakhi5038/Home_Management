import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/controller/grocery_notifier_states.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/model/grocery_model.dart';
import 'package:flutter_project_home_manager/services/database_services/local_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GrocceryNotifier extends Notifier<GroceryState> {
  static const _errorMessage = 'Something went wrong';
  static const _notInsertedMessage = 'Couldn\'t add grocery';
  final TextEditingController controllerForItemName = TextEditingController();
  final TextEditingController controllerForItemPrice = TextEditingController();
  final TextEditingController controllerForItemQuantity =
      TextEditingController();
  final TextEditingController controlllerForDropDownMenu =
      TextEditingController();
  final LocalDB db = LocalDB();
  List<GroceryModel> groceries = [];
  // expanded tile
  var currentTileIndex = -1;
  var currentTileTotal = 0;
  var currentTileUsed = 0;

  @override
  GroceryState build() {
    ref.onDispose(() {
      controllerForItemName.dispose();
      controllerForItemPrice.dispose();
      controllerForItemQuantity.dispose();
      controlllerForDropDownMenu.dispose();
    });

    return GroceryLoadingState();
  }

  void fetchList() async {
    try {
      state = GroceryLoadingState();
      groceries = await db.groceries();
      state = GroceryLoadedState(list: groceries);
    } catch (e) {
      state = const GroceryErrorState(errorMessage: _errorMessage);
    }
  }

  void addGrocery(GroceryModel grocery) async {
    try {
      state = GroceryLoadingState();
      bool isInserted = await db.insertGrocery(grocery);
      if (isInserted) {
        groceries = await db.groceries();
        state = GroceryLoadedState(list: groceries);
      } else {
        state = const GroceryErrorState(errorMessage: _notInsertedMessage);
      }
    } catch (e) {
      state = const GroceryErrorState(errorMessage: _errorMessage);
    }
  }

  void deleteGrocery(GroceryModel grocery) async {
    try {
      state = GroceryLoadingState();
      bool isInserted = await db.deleteGrocery(grocery);
      if (isInserted) {
        groceries = await db.groceries();
        state = GroceryLoadedState(list: groceries);
      } else {
        state = const GroceryErrorState(errorMessage: _notInsertedMessage);
      }
    } catch (e) {
      state = const GroceryErrorState(errorMessage: _errorMessage);
    }
  }

  void updateGrocery() async {
    try {
      var grocery = groceries[currentTileIndex];            
      var updatedGrocery = grocery.copyWith(
          totalQuantity: currentTileTotal, usedQuantity: currentTileUsed,);      
      state = GroceryLoadingState();
      var isUpdated = await db.updateGrocery(updatedGrocery);
      log('[IsUpdated : $isUpdated]');
      if (isUpdated) {
        groceries = await db.groceries();
        state = GroceryLoadedState(list: groceries);
      } else {
        state = const GroceryErrorState(errorMessage: _notInsertedMessage);
      }
    } catch (e) {
      log('[Error Message : ${e.toString()}]');
      state = const GroceryErrorState(errorMessage: _errorMessage);
    }
  }

  void setInitials(int index, int total, int used) {
    currentTileIndex = index;
    currentTileTotal = total;
    currentTileUsed = used;
  }

  void incrementTotal() {
    currentTileTotal++;    
    state = GroceryUpdateDialogState(total: currentTileTotal, used: currentTileUsed);
  }

  void decrementTotal() {
    if (currentTileTotal > 0) {
      currentTileTotal--;      
      state = GroceryUpdateDialogState(total: currentTileTotal, used: currentTileUsed);
    }
  }

  void incrementUsed() {    
    currentTileUsed++;
    state = GroceryUpdateDialogState(total: currentTileTotal, used: currentTileUsed);
  }

  void decrementUsed() {
    if (currentTileUsed > 0) {
      currentTileUsed--;      
      state = GroceryUpdateDialogState(total: currentTileTotal, used: currentTileUsed);
    }
  }

  void resetControllers() {
    controllerForItemName.clear();
    controllerForItemPrice.clear();
    controllerForItemQuantity.clear();
    controlllerForDropDownMenu.clear();
  }

    Future<double> totalExpenseSum(double currentExpense) async {
    var groceriesExpense = 0.0;
    try {
      var listOfGroceries = await db.groceries();
      for (var element in listOfGroceries) {
        groceriesExpense += (element.itemPrice * element.totalQuantity);
      }
    } catch (e) {      
      log(e.toString());
    }    
    var utilitiesExpense = 0.0;
    try {
      var listOfBills = await db.utilites();
      for (var element in listOfBills) {
        utilitiesExpense += element.paidAmount;
      }
    } catch (e) {      
      log(e.toString());
    }
    return groceriesExpense + utilitiesExpense + currentExpense;
  }   
}

final groceriesProvider =
    NotifierProvider<GrocceryNotifier, GroceryState>(GrocceryNotifier.new);
