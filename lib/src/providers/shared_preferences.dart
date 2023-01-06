import 'package:shared_preferences/shared_preferences.dart';

class StorePreferences {
  static final StorePreferences _singleton = StorePreferences._internal();

  Future<String?> getValue(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<List<String>?> getValues(String items) async {
    final prefs = await SharedPreferences.getInstance();
// Try reading data from the 'items' key. If it doesn't exist, returns null.
    return prefs.getStringList('items');
  }

  Future<bool> delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    // Remove data for the 'counter' key.
    return await prefs.remove(key);
  }

  Future<bool> write(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();

    /// Save an String value to 'action' key.
    return prefs.setString(key, value);
  }

  Future<bool> writeListString(key, List<String> values) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setStringList(key, values);
  }

  factory StorePreferences() {
    return _singleton;
  }

  StorePreferences._internal();
}
