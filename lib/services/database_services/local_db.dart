import 'dart:async';
import 'dart:developer';

import 'package:flutter_project_home_manager/pages/groceries_page/model/grocery_model.dart';
import 'package:flutter_project_home_manager/pages/utilities_page/model/utility_bill_item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class LocalDB {
  static const dbVersion = 1;
  static LocalDB? _instance;
  LocalDB._();
  factory LocalDB() => _instance ??= LocalDB._();

  static Database? _db;

  Future<Database> get database async => _db ??= await openDatabase(
        path.join(await getDatabasesPath(), 'HomeItems'),
        version: dbVersion,
        onCreate: _onCreateDatabase,
        onUpgrade: _onUpgradeDatabase,
      );

  FutureOr<void> _onCreateDatabase(Database db, int version) {
    db.execute(GroceryModel.createTable);
    db.execute(UtiltityBillItem.createTable);
  }

  FutureOr<void> _onUpgradeDatabase(
      Database db, int oldVersion, int newVersion) {
    db.execute(GroceryModel.dropTable);
    db.execute(UtiltityBillItem.dropTable);
    db.execute(GroceryModel.createTable);
    db.execute(UtiltityBillItem.createTable);
  }

  Future<bool> insertGrocery(GroceryModel grocery) async {
    final db = await database;
    int noOfRowsAffected =
        await db.insert(GroceryModel.tableName, grocery.toMap());
    return noOfRowsAffected > 0;
  }

  Future<bool> updateGrocery(GroceryModel grocery) async {
    final db = await database;
    int noOfRowsAffected = await db.update(
      GroceryModel.tableName,
      grocery.toMap(),
      where: '${GroceryModel.colId} = ?',
      whereArgs: [
        grocery.id.toString(),
      ],
    );
    return noOfRowsAffected > 0;
  }

  Future<bool> deleteGrocery(GroceryModel grocery) async {
    final db = await database;
    int noOfRowsAffected = await db.delete(
      GroceryModel.tableName,
      where: '${GroceryModel.colId} = ?',
      whereArgs: [
        grocery.id.toString(),
      ],
    );
    return noOfRowsAffected > 0;
  }

  Future<List<GroceryModel>> groceries() async {
    final db = await database;
    final listOfMaps = await db.query(GroceryModel.tableName);
    return listOfMaps
        .map(
          (map) => GroceryModel.fromMap(map),
        )
        .toList();
  }

  Future<bool> insertUtilityBill(UtiltityBillItem utilityBill) async {
    final db = await database;
    int noOfRowsAffected =
        await db.insert(UtiltityBillItem.tableName, utilityBill.toMap());
    return noOfRowsAffected > 0;
  }

  Future<bool> deleteUtitliyBill(UtiltityBillItem utilityBill) async {
    final db = await database;
    int noOfRowsAffected = await db.delete(
      UtiltityBillItem.tableName,
      where: '${UtiltityBillItem.colId} = ?',
      whereArgs: [
        utilityBill.id.toString(),
      ],
    );
    return noOfRowsAffected > 0;
  }

  Future<bool> updateUtilityBill(UtiltityBillItem utilityBill) async {
    final db = await database;
    int noOfRowsAffected = await db.update(
      UtiltityBillItem.tableName,
      utilityBill.toMap(),
      where: '${UtiltityBillItem.colId} = ?',
      whereArgs: [
        utilityBill.id.toString(),
      ],
    );
    return noOfRowsAffected > 0;
  }

  Future<List<UtiltityBillItem>> utilites() async {
    final db = await database;
    final listOfMaps = await db.query(UtiltityBillItem.tableName);
    return listOfMaps
        .map(
          (map) => UtiltityBillItem.fromMap(map),
        )
        .toList();
  }

  Future<bool> deleteAllGroceries() async {
    final db = await database;
    final totalGroceries = await groceries();
    int numberOfRowsAffected = 0;
    for (var i = 0; i < totalGroceries.length; i++) {
      numberOfRowsAffected = await db.delete(
        GroceryModel.tableName,
        where: '${GroceryModel.colId} = ?',
        whereArgs: [
          totalGroceries[i].id.toString(),
        ],
      );
    }
    log('$numberOfRowsAffected');
    return numberOfRowsAffected >= 0;
  }

  Future<bool> deleteAllUtitlities() async {
    final db = await database;
    final totalUtilities = await utilites();
    int numberOfRowsAffected = 0;
    for (var i = 0; i < totalUtilities.length; i++) {
      numberOfRowsAffected = await db.delete(
        UtiltityBillItem.tableName,
        where: '${UtiltityBillItem.colId} = ?',
        whereArgs: [
          totalUtilities[i].id.toString(),
        ],
      );
      log('$numberOfRowsAffected');
    }
    return numberOfRowsAffected >= 0;
  }
}
