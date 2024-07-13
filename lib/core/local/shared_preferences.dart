import 'package:shared_preferences/shared_preferences.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static String? savedPhone;

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    savedPhone = prefs.getString('savedPhone');
  }

  static Future<void> savePhone(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('savedPhone', phone);
    savedPhone = phone;
  }

  static Future<String?> getSavedPhone() async {
    final prefs = await SharedPreferences.getInstance();
    savedPhone = prefs.getString('savedPhone');
    return savedPhone;
  }
}
