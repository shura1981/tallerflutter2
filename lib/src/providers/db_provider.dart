import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taller_flutter/src/qr_map/model/scandmodel.dart';
export 'package:taller_flutter/src/qr_map/model/scandmodel.dart';
import 'package:path/path.dart' show join;

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  /// getter to get the database
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  /// create the database
  initDB() async {
    // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // final path = documentsDirectory.path + 'ScansDB.db';
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'ScansDB.db');
    print(path);

    return await openDatabase(path, version: 2, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Scans('
          'id INTEGER PRIMARY KEY  AUTOINCREMENT,'
          'tipo TEXT,'
          'valor TEXT'
          ')');
    });
  }

  // Future<dynamic> nuevoScand(ScanModel model) async {
  //   final db = await database;
  //   final res = await db!.insert('Scans', model.toJson());
  //   return res;
  // }

  Future<dynamic> nuevoScand(ScanModel model) async {
    final db = await database;
    final res = await db!.rawInsert(
        "INSERT Into Scans (tipo, valor) VALUES ('${model.tipo}', '${model.valor}') ");
    return res;
  }

  Future<dynamic> deleteScand(int i) async {
    final db = await database;
    final res = await db!.delete('Scans', where: 'id = ?', whereArgs: [i]);
    return res;
  }

  Future<dynamic> deleteScandAll() async {
    final db = await database;
    final res = await db!.delete('Scans');
    return res;
  }

  Future<dynamic> updateScand(int i, ScanModel model) async {
    final db = await database;
    final res = await db!
        .update('Scans', model.toJson(), where: 'id = ?', whereArgs: [i]);
    return res;
  }

  Future<ScanModel?> getScandById(int i) async {
    final db = await database;
// final res = await db!.rawQuery('SELECT * FROM Scans');
// return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
    final res = await db!.query('Scans', where: 'id = ?', whereArgs: [i]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel?>> getScandByType(String type) async {
    final db = await database;
    final res = await db!.rawQuery("SELECT * FROM Scans WHERE tipo = '$type'");
    return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];
  }

  Future<List<ScanModel?>> getScandAll() async {
    final db = await database;
    final res = await db!.rawQuery('SELECT * FROM Scans');
    return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];
  }
}
