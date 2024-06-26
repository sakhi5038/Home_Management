// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class GroceryModel {
  static const tableName = 'groceries';
  static const colId = 'id';
  static const colItemName = 'itemName';
  static const colItemPrice = 'itemPrice';
  static const colTotalQuantity = 'totalQuantity';
  static const colUsedQuantity = 'usedQuantity';
  static const createTable = 'CREATE TABLE IF NOT EXISTS $tableName ( $colId INTEGER PRIMARY KEY , $colItemName TEXT , $colItemPrice REAL , $colTotalQuantity INTEGER , $colUsedQuantity INTEGER )';
  static const dropTable = 'DROP TABLE IF EXISTS $tableName';
  static const selectAll = 'SELECT * FROM $tableName';    

  int? id;
  final String itemName;
  final num itemPrice; // num
  final int totalQuantity;
  final int usedQuantity;
  final IconData icon;
  GroceryModel({
    this.id,
    required this.itemName,
    required this.itemPrice,
    required this.totalQuantity,
    required this.usedQuantity,
    required this.icon,
  });
  

  GroceryModel copyWith({
    String? itemName,
    num? itemPrice,
    int? totalQuantity,
    IconData? icon,
    int? usedQuantity,
    int? id,
  }) {
    return GroceryModel(
      id: id ?? this.id,
      itemName: itemName ?? this.itemName,
      itemPrice: itemPrice ?? this.itemPrice,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      usedQuantity: usedQuantity ?? this.usedQuantity,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      colId : id, // Null so that sqlite automatically handles this id
      colItemName : itemName,
      colItemPrice : itemPrice,
      colTotalQuantity : totalQuantity,
      colUsedQuantity : usedQuantity,      
    };
  }

  factory GroceryModel.fromMap(Map<String, dynamic> map) {
    return GroceryModel(
      id: map[colId] as int,
      itemName: map[colItemName] as String,
      itemPrice: map[colItemPrice] as num,
      totalQuantity: map[colTotalQuantity] as int,
      usedQuantity: map[colUsedQuantity] as int,
      icon: IconData((map['icon'] ?? 0) as int, fontFamily: 'MaterialIcons'),
    );
  }

  String toJson() => json.encode(toMap());

  factory GroceryModel.fromJson(String source) => GroceryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GroceryModel(itemName: $itemName, itemPrice: $itemPrice, totalQuantity: $totalQuantity, icon: $icon)';
  }

  @override
  bool operator ==(covariant GroceryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.itemName == itemName &&
      other.itemPrice == itemPrice &&
      other.totalQuantity == totalQuantity &&
      other.icon == icon;
  }

  @override
  int get hashCode {
    return itemName.hashCode ^
      itemPrice.hashCode ^
      totalQuantity.hashCode ^
      icon.hashCode;
  }
}
