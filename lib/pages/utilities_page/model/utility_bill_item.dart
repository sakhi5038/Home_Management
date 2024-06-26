// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

extension DateTimeString on DateTime {
  String convertToString() {
    String monthInEnglish = switch (month) {
      1 => 'January',
      2 => 'February',
      3 => 'March',
      4 => 'August',
      5 => 'May',
      6 => 'June',
      7 => 'July',
      8 => 'August',
      9 => 'September',
      10 => 'Octuber',
      11 => 'November',
      12 => 'December',
      _ => 'error'
    };

    String dayInProperFormat = day < 10 ? '0$day' : '$day';

    return '$dayInProperFormat  $monthInEnglish  $year';
  }
}

class UtiltityBillItem {
  static const tableName = 'utilites';
  static const colId = 'id';
  static const colBillType = 'billType';
  static const colPaidAmount = 'paidAmount';
  static const colDateTime = 'dateTime';  
  static const createTable = 'CREATE TABLE IF NOT EXISTS $tableName ( $colId INTEGER PRIMARY KEY , $colBillType TEXT , $colPaidAmount REAL , $colDateTime INTEGER )';
  static const dropTable = 'DROP TABLE IF EXISTS $tableName';
  static const selectAll = 'SELECT * FROM $tableName';
  int? id;
  DateTime dateTime;
  String billType;
  double paidAmount;
  UtiltityBillItem({
    this.id,
    required this.dateTime,
    required this.billType,
    required this.paidAmount,
  });
  

  UtiltityBillItem copyWith({
    int? id,
    DateTime? dateTime,
    String? billType,
    double? paidAmount,
  }) {
    return UtiltityBillItem(
      id: id ?? this.id,
      dateTime: dateTime ?? this.dateTime,
      billType: billType ?? this.billType,
      paidAmount: paidAmount ?? this.paidAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      colId : id,
      colDateTime : dateTime.millisecondsSinceEpoch,
      colBillType : billType,
      colPaidAmount : paidAmount,
    };
  }

  factory UtiltityBillItem.fromMap(Map<String, dynamic> map) {
    return UtiltityBillItem(
      id: map[colId] as int,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map[colDateTime] as int),
      billType: map[colBillType] as String,
      paidAmount: map[colPaidAmount] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory UtiltityBillItem.fromJson(String source) => UtiltityBillItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UtiltityBillItem(id: $id, dateTime: $dateTime, billType: $billType, paidAmount: $paidAmount)';
  }

  @override
  bool operator ==(covariant UtiltityBillItem other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.dateTime == dateTime &&
      other.billType == billType &&
      other.paidAmount == paidAmount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      dateTime.hashCode ^
      billType.hashCode ^
      paidAmount.hashCode;
  }
}
