import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._();
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    switch (value) {
      case String:
        return await sharedPreferences.setString(key, value);
      case int:
        return await sharedPreferences.setInt(key, value);
      case bool:
        return await sharedPreferences.setBool(key, value);
      case double:
        return await sharedPreferences.setDouble(key, value);
      case List<String>:
        return await sharedPreferences.setStringList(key, value);
      default:
        return Future<bool>.value(false);
    }
  }

  static getData({
    required String key,
  }) async {
    sharedPreferences.get(key);
  }
}
