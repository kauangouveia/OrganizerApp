import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static Future<SharedPreferences> get preferences => _prefs;


  static clearKey(String key) async {
    final SharedPreferences prefs = await preferences;
    Set<String> keys = prefs.getKeys();
    keys.remove(key);
  }

  static clearAllStorage() async {
    final SharedPreferences prefs = await preferences;
    await prefs.clear();
  }

  static setString(String key, String value) async {
    final SharedPreferences prefs = await preferences;
    prefs.setString(key, value);
  }

  static getString(String key) async {
    final SharedPreferences prefs = await preferences;
    return prefs.getString(key);
  }

  static setInt(String key, int value) async {
    final SharedPreferences prefs = await preferences;
    prefs.setInt(key, value);
  }

  static getInt(String key) async {
    final SharedPreferences prefs = await preferences;
    prefs.getInt(key);
  }

  static setBool(String key, bool value) async {
    final SharedPreferences prefs = await preferences;
    prefs.setBool(key, value);
  }

  static Future<bool?> getBool(String key) async {
    final SharedPreferences prefs = await preferences;
    return prefs.getBool(key);
  }

  static deleteKey(String key) async {
    final SharedPreferences prefs = await preferences;
    return prefs.remove(key);
  }

  static setStringList(String key, List<String> value) async {
    final SharedPreferences prefs = await preferences;
    prefs.setStringList(key, value);
  }

  static getStringList(String key) async {
    final SharedPreferences prefs = await preferences;
    return prefs.getBool(key) ?? [];
  }
}
