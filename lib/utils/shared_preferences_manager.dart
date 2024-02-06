import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  SharedPreferencesManager._privateConstructor();
  SharedPreferences? _preferences;
  static final SharedPreferencesManager _instance =
      SharedPreferencesManager._privateConstructor();

  factory SharedPreferencesManager() {
    return _instance;
  }

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  //write data
  Future<void> saveInt(String key, int value) async {
    await _preferences?.setInt(key, value);
  }

  Future<void> saveString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  Future<void> saveBool(String key, bool value) async {
    await _preferences?.setBool(key, value);
  }

  //read data
  String? getString(String key) {
    return _preferences?.getString(key);
  }

  int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  //remove data
  Future<void> removeData(String key) async {
    await _preferences?.remove(key);
  }
}
