import 'dart:async';
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:flutter/services.dart';

class Data {
  Database? _db;
  final StreamController<List<Map>> _alimentos = StreamController<List<Map>>();
  Stream<List<Map>> get alimentos => _alimentos.stream;
  Data() {
    read().then((value) => _alimentos.add(value));
  }

  void dispose() {
    print('se elimina');
    _alimentos.close();
  }

  _opendb() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'megastore.db');
    // print("ruta:  " +databasesPath);
// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print('Creating new copy from asset ');

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data =
          await rootBundle.load(join('assets', 'database/megastore.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } 
// open the database
    _db = await openDatabase(path);
  }

  _closedb() async {
    await _db!.close();
  }

  Future<List<Map>> read() async {
    List<Map> list = [];
    try {
      await _opendb();
      list = await _db!.rawQuery(
          'SELECT id, alimentos, clasificación, proteina, chos, grasa, calorias, unidad_medida, cantidad FROM tb_tabla ORDER BY id ASC');
    } catch (e) {
      print(e);
    } finally {
      _closedb();
    }
    return list;
  }

  void find(String key) async {
    List<Map> list = [];
    try {
      await _opendb();
      String query =
          "SELECT id, alimentos, clasificación, proteina, chos, grasa, calorias, unidad_medida, cantidad FROM tb_tabla WHERE alimentos Like '%$key%' ORDER BY id ASC";
      list = await _db!.rawQuery(query);
      _alimentos.add(list);
    } catch (e) {
      print(e);
    } finally {
      _closedb();
    }
  }
}
