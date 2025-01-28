import 'package:shared_preferences/shared_preferences.dart';
//CacheHelper That's Connect and Talk to local database.

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  //Here The Initialize of cache .

  static Future<void>  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

 static String? getDataString({
    required String key,
  }) {
    return sharedPreferences!.getString(key);
  }

// this fun to put data in local data base using key

 static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    }

    if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    } else {
      return await sharedPreferences!.setDouble(key, value);
    }
  }

  // this fun to get data already saved in local data base

  static dynamic getData({required String key}) {
    return sharedPreferences!.get(key);
  }

// remove data using specific key

 static Future<bool> removeData({required String key}) async {
    return await sharedPreferences!.remove(key);
  }
 static Future<bool> containsKey({required String key}) async {
    return  sharedPreferences!.containsKey(key);
  }

  //clear all data in the local data base
 static Future<bool> clearData() async {
    return await sharedPreferences!.clear();
  }

  // this fun to put data in local data base using key
 static Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    } else {
      return await sharedPreferences!.setInt(key, value);
    }
  }

 //  final String _cachedCode = "cachedCode";
 //
 // static String getCachedLanguage() {
 //    final code = sharedPreferences!.getString(_cachedCode);
 //    if (code != null) {
 //      return code;
 //    } else {
 //      return 'ar';
 //    }
 //  }
 //
 // static Future<void> cacheLanguage(String code) async {
 //    await sharedPreferences.setString(_cachedCode, code);
 //  }



  static void deletePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys(); // Get all stored keys
    for (String key in keys) {
      if (key != "new_host") {
        await prefs.remove(key); // Remove all keys except the specified one
      }
    }
  }

  static void saveNewHost(String newHost) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("new_host", newHost);
  }

  static Future<String> getNewHost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("new_host") ?? "";
  }


}