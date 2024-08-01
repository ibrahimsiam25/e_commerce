import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }
  static setBool (String key, bool value) async {
    _instance.setBool(key, value);
  }

  static getBool (String key) async {
    return _instance.getBool(key) ??false;
}

}