import 'package:shared_preferences/shared_preferences.dart';

class BasePreferences {
  Future<T> get<T>(String key, T defaultValue) async {
    final prefs = await SharedPreferences.getInstance();
    T? result;

    switch (defaultValue.runtimeType) {
      case const (String):
        result = prefs.getString(key) as T?;
      case const (bool):
        result = prefs.getBool(key) as T?;
      case const (int):
        result = prefs.getInt(key) as T?;
      case const (double):
        result = prefs.getDouble(key) as T?;
      case const (List<String>):
        result = prefs.getStringList(key) as T?;
    }
    return result ?? defaultValue;
  }

  Future<void> put<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();

    switch (value.runtimeType) {
      case const (String):
        await prefs.setString(key, value as String);
      case const (bool):
        await prefs.setBool(key, value as bool);
      case const (double):
        await prefs.setDouble(key, value as double);
      case const (int):
        await prefs.setInt(key, value as int);
      case const (List<String>):
        await prefs.setStringList(key, value as List<String>);
    }
  }

  Future<void> clearPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<bool> removePrefByKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  Future<void> reload() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.reload();
  }
}
