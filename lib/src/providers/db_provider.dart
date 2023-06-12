import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taller2/src/qr_map/model/scandmodel.dart';
export 'package:taller2/src/qr_map/model/scandmodel.dart';

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
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = documentsDirectory.path + 'ScansDB.db';
    print(path);

    return await openDatabase(path, version: 4, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Scans('
          'id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,'
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
}
