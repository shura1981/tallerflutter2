import 'dart:io';
import 'package:path_provider/path_provider.dart';

class StorageFile {
  static final StorageFile _singleton = StorageFile._internal();

  Future<String?> getvalue() async {
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/todos.json');
      final isExist = await file.exists();
      if (isExist) {
        return await file.readAsString();
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> write(String jsonText) async {
// Write value
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/todos.json');
      await file.writeAsString(jsonText);
      return 'Guardado con éxito';
    } catch (e) {
      return 'ocurrió un error: ' + e.toString();
    }
  }

  factory StorageFile() {
    return _singleton;
  }

  StorageFile._internal();
}
