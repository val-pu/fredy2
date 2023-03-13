

import 'package:fredy2/api/auth/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLoginCreds(LoginModel loginModel) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("access_token", loginModel.accessToken);
  prefs.setString("refresh_token", loginModel.refreshToken);
  prefs.setString("username", loginModel.username);
  prefs.setString("access_token_expires",
      loginModel.accessTokenExpires.toIso8601String());
  prefs.setString("refresh_token_expires",
      loginModel.refreshTokenExpires.toIso8601String());
  prefs.setString("user_id", loginModel.userId);
}

Future<void> clearLoginCreds() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  for (var element in <String>[
    "access_token", "refresh_token", "username",
    "access_token_expires", "refresh_token_expires",
    "user_id"
  ]) {
    await prefs.remove(element);
  }
}