import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String token = "token";
  final SharedPreferences prefs;
  var userToken;

  SharedPreferenceHelper( {this.userToken,required this.prefs});

  Future<void> setUserToken({required String userToken}) async {
    await prefs.setString(token, userToken);
    print("prefs"+prefs.toString());
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