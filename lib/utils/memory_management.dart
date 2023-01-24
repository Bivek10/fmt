

import 'package:fmt/utils/shared_pref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemoryManagement {
  static SharedPreferences? prefs;

  static Future<bool> init() async {
    prefs = await SharedPreferences.getInstance();
    return true;
  }

  static String getFirebaseToken() {
    return prefs!.getString(SharedPrefsKeys.FIREBASE_TOKEN)!;
  }


  static void clearMemory() async {
    await prefs!.clear();
  }
}
