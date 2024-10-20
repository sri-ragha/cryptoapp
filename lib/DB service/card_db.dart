// ignore_for_file: avoid_print, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CardData extends GetxController {
  static final CardData instance = CardData();
  static Database? _database;
  CardData();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initdatabase();
    return _database!;
  }

  Future<Database> _initdatabase() async {
    Directory data_directory = await getApplicationDocumentsDirectory();
    print('DB Location:' + data_directory.path);
    final String path = join(await getDatabasesPath(), 'cards_data.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _CreateDatabase,
    );
  }

  Future<void> _CreateDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cards_table (
        id INTEGER PRIMARY KEY,
        name TEXT,
        cardnumber TEXT,
        cvv TEXT,
        expdate TEXT
      )
    ''');
  }

  Future<int> insertcarddetail(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('cards_table', row);
  }

  Future<List<Map<String, dynamic>>> getallcarddetails() async {
    Database db = await instance.database;
    return await db.query('cards_table');
  }

  Future<int> updatecarddetails(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row['id'];
    return await db.update('cards_table', row, where: 'id=?', whereArgs: [id]);
  }

  Future<int> deletecarddetails(int id) async {
    Database db = await instance.database;

    return await db.delete('cards_table', where: 'id=?', whereArgs: [id]);
  }
}
