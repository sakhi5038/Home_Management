// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class QuantityModel {
  int total;
  int used;
  bool isExpanded;
  final int index;
  final num itemPrice; // num
  final IconData icon;
  QuantityModel(
      {required this.total,
      required this.used,
      required this.isExpanded,
      required this.index,
      required this.itemPrice,
      required this.icon});

  QuantityModel copyWith({
    IconData? icon,
    int? total,
    int? used,
    bool? isExpanded,
    int? index,
    num? itemPrice,
  }) {
    return QuantityModel(
      icon: icon ?? this.icon,
      total: total ?? this.total,
      used: used ?? this.used,
      isExpanded: isExpanded ?? this.isExpanded,
      index: index ?? this.index,
      itemPrice: itemPrice ?? this.itemPrice,
    );
  }
}
