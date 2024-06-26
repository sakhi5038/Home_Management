import 'package:flutter/material.dart';

@immutable
abstract class OverviewPageStates {
  const OverviewPageStates();
}

@immutable
final class OverviewPageInitialState extends OverviewPageStates {}

@immutable
final class OverviewPageLoadingState extends OverviewPageStates {}

@immutable
final class OverViewPageLoadedState extends OverviewPageStates {
  final num totalBudget, remainingBudget, groceryExpense, utilitiesExpense;
  const OverViewPageLoadedState(
      {required this.totalBudget,
      required this.groceryExpense,
      required this.remainingBudget,
      required this.utilitiesExpense});
}

@immutable
final class OverviewPageErrorState extends OverviewPageStates {
  final String errorMessage;
  const OverviewPageErrorState({required this.errorMessage});
}
