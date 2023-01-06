import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static final LocalStorage _singleton = LocalStorage._internal();
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<String?> getValue(String key) async {
    // Read value
    return await _storage.read(key: key);
  }

  Future<Map<String, String>> getValues() async {
// Read all values
    return await _storage.readAll();
  }

  Future<void> delete(String key) async {
    // Delete value
    await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
// Delete all
    await _storage.deleteAll();
  }

  Future<void> write(String key, String value) async {
// Write value
    await _storage.write(key: key, value: value);
  }

  factory LocalStorage() {
    return _singleton;
  }

  LocalStorage._internal();
}
