import 'package:flutter/material.dart';

@immutable
abstract class UtilityPageStates {}

@immutable
class UtilityPageInitialState extends UtilityPageStates {}

@immutable
class UtilityPageAddItemState extends UtilityPageStates {}

@immutable
class UtilityPageDialogCatogoryUpdatedState extends UtilityPageStates {}

@immutable
class UtilityPageDialogDateAddedState extends UtilityPageStates {}

@immutable
class UtilityPageRemoveItemState extends UtilityPageStates {}

@immutable
class UtilityPageUpdateItemState extends UtilityPageStates {}
