import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String token = "token";
  String primary = "";
  final SharedPreferences prefs;
  var userToken;
  var primaryColor;

  SharedPreferenceHelper(
      {this.userToken, required this.prefs, this.primaryColor});

  Future<void> setPrimaryColor({required String color}) async {
    await prefs.setString(primary, color);
    log("prefs" + prefs.toString());
  }

  String getPrimaryColor() {
    primaryColor = prefs.getString(primary);
    return primaryColor!;
  }

  Future<void> setUserToken({required String userToken}) async {
    await prefs.setString(token, userToken);
    print("prefs" + prefs.toString());
  }

  String getUserToken() {
    userToken = prefs.getString(token);
    return userToken!;
  }

  bool containsToken() {
    return prefs.containsKey("token") && prefs.getString("token") != null;
  }

  Future logout() async {
    await prefs.remove('token');
  }
}
