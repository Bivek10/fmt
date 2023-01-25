import 'package:fmt/utils/shared_pref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemoryManagement {
  static SharedPreferences? prefs;

  static Future<bool> init() async {
    prefs = await SharedPreferences.getInstance();
    return true;
  }

  static String? getFirebaseToken() {
    return prefs!.getString(SharedPrefsKeys.FIREBASE_TOKEN)!;
  }

  static void setFirebaseToken({String? tokenID}) {
    prefs!.setString(SharedPrefsKeys.FIREBASE_TOKEN, tokenID!);
  }

  static String? getUserName() {
    return prefs!.getString(SharedPrefsKeys.USER_NAME)!;
  }

  static void setUserName({String? username}) {
    prefs!.setString(SharedPrefsKeys.USER_NAME, username!);
  }

  static void clearMemory() async {
    await prefs!.clear();
  }
}
