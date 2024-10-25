import 'package:shared_preferences/shared_preferences.dart';
import 'package:teslo_app/features/shared/infrastructure/infrastructure.dart';

class KeyValueStorageServiceImpl extends KeyValueStorageService {
  Future<SharedPreferences> getSharedPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<T?> getValue<T>(String key) async {
    final prefs = await getSharedPrefs();
    if (T == int) return prefs.getInt(key) as T?;
    if (T == bool) return prefs.getBool(key) as T?;
    if (T == String) return prefs.getString(key) as T?;
    if (T == double) return prefs.getDouble(key) as T?;
    if (T == List<String>) return prefs.getStringList(key) as T?;

    return null;
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final prefs = await getSharedPrefs();

    if (value is int) prefs.setInt(key, value as int);
    if (value is bool) prefs.setBool(key, value as bool);
    if (value is String) prefs.setString(key, value as String);
    if (value is double) prefs.setDouble(key, value as double);
    if (value is List<String>) prefs.setStringList(key, value as List<String>);
  }

  @override
  Future<bool> removeKey(String key) async {
    final prefs = await getSharedPrefs();
    return prefs.remove(key);
  }
}
