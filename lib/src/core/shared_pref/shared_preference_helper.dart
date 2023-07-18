import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String token = "token";
  final SharedPreferences prefs;

  SharedPreferenceHelper({required this.prefs});

  Future<void> setUserToken({required String userToken}) async {
    await prefs.setString(token, userToken);
    print("prefs"+prefs.toString());
  }

  String getUserToken() {
    final userToken = prefs.getString(token);
    return userToken!;
  }
  //  bool containsToken() {
  //   return prefs.containsKey(tokenKey) && prefs.getString(tokenKey) != null;
  // }

  Future logout() async {
  await prefs.remove('token');
}
}