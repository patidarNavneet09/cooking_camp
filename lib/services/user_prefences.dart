import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServices {
  static String registerUserIdentityDetails = "RegisterUserIdentityDetails";
  static String loginUserIdentityDetails = "LoginUserIdentityDetails";
  static String deviceId = "deviceId";
  static String deviceType = "deviceType";
  static String isLogin = "isLogin";
  static String fcm = "FCM";
  static String userToken = "user Token";
  static String parentId = "ParentId";


  ///..... SharePrefences save data ........
  static void setPreferencesData(String key, dynamic data) async {
    final prefences = await SharedPreferences.getInstance();
    if (data is String) {
      prefences.setString(key, data);
    } else if (data is int) {
      prefences.setInt(key, data);
    } else if (data is bool) {
      prefences.setBool(key, data);
    } else if (data is double) {
      prefences.setDouble(key, data);
    } else {
      debugPrint("Invalid datatype");
    }
  }

  static Future<dynamic> getPreferencesData(String key) async {
    final preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey(key)) {
      // Try to determine the type of the stored data
      dynamic data = preferences.get(key);
      return data;
    } else {
      debugPrint("Key not found");
      return null;
    }
  }

  static void setLogoutPreferencesData(){
    setPreferencesData(isLogin, false);
    setPreferencesData(userToken,"");
  }


  ///---------------------Delete Data------------------------

  static Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }


  ///---------------------Clear all Data------------------------

  static Future clearData() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }


}
