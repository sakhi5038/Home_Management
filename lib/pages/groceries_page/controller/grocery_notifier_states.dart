import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/groceries_page/model/grocery_model.dart';

@immutable
abstract class GroceryState{
  const GroceryState();
}

@immutable
class GroceryInitialState extends GroceryState{}

@immutable
class GroceryLoadingState extends GroceryState{}

@immutable
class GroceryLoadedState extends GroceryState{
  final List<GroceryModel> list;
  const GroceryLoadedState({required this.list});
}

@immutable
class GroceryErrorState extends GroceryState{
  final String errorMessage;
  const GroceryErrorState({required this.errorMessage});
}

@immutable
class GroceryUpdateDialogState extends GroceryState{
  final int total , used;
  const GroceryUpdateDialogState({required this.total , required this.used});
}