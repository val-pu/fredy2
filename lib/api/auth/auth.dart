import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../api.dart';
import 'models.dart';

Future<LoginModel> login(String mail, String password) async {
  Map<String, String> body = {"mail": mail, "password": password};
  Response resp = await http.post(httpMethod(apiUrl, "auth/login"),
      body: jsonEncode(body), headers: requestHeader);
  if (resp.statusCode == 200) {
    return LoginModel.fromJson(jsonDecode(resp.body));
  }
  if (resp.statusCode == 401) {
    return Future.error("Wrong credentials");
  }
  return Future.error("Something went wrong");
}

Future<LoginModel> refresh(String refreshToken) async {
  Map<String, String> body = {"refresh_token": refreshToken};
  Response resp = await http.post(httpMethod(apiUrl, "auth/refresh"),
      body: jsonEncode(body), headers: requestHeader);

  return LoginModel.fromJson(jsonDecode(resp.body));
}

Future<void> register(String mail, String password, String username) async {
  Map<String, String> body = {
    "mail": mail,
    "password": password,
    "username": username
  };
  Response resp = await http.post(httpMethod(apiUrl, "auth/register"),
      body: jsonEncode(body), headers: requestHeader);

  if (resp.statusCode == 201) {
    return;
  }
  return Future.error("Bad request");
}

void main() async {}
