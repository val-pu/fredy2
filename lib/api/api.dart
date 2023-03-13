import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String apiUrl = "192.168.178.29:8080";

Uri Function(String, String, [Map<String, dynamic> queryParameters])
    httpMethod = Uri.http;

const Map<String, String> requestHeader = {
  "content-type": "application/json",
  "accept": "application/json",
//  "User-Agent": ""
};

Future<http.Response> get(String path) async {
  http.Response resp =
      await http.get(httpMethod(apiUrl, path), headers: requestHeader);
  return resp;
}

Future<http.Response> getAuthenticated(String path) async {
  var sharedPreferences = await SharedPreferences.getInstance();

  String? accessToken = sharedPreferences.getString("access_token");
  if (accessToken == null) {
    return Future.error("Unauthenticated");
  }
  Map<String, String> headers = {...requestHeader};
  headers["Authorization"] = accessToken;
  return await http.get(httpMethod(apiUrl, path), headers: headers);
}

Future<http.Response> post(Object? data, path) async {
  if (data == null){

  }
  return await http.post(
      httpMethod(apiUrl, path),
      body: data != null ? jsonEncode(data) : null,
      headers: requestHeader
  );
}

Future<http.Response> postAuthenticated(Object? data, String path) async {
  var sharedPreferences = await SharedPreferences.getInstance();

  String? accessToken = sharedPreferences.getString("access_token");
  if (accessToken == null) {
    return Future.error("Unauthenticated");
  }
  var headers = requestHeader;
  headers["Authorization"] = accessToken;

  return await http.post(
      httpMethod(apiUrl, path),
      body: data != null ? jsonEncode(data) : null,
      headers: headers
  );
}

Future<http.Response> putAuthenticated(String path) async {
  var sharedPreferences = await SharedPreferences.getInstance();

  String? accessToken = sharedPreferences.getString("access_token");
  if (accessToken == null) {
    return Future.error("Unauthenticated");
  }
  var headers = requestHeader;
  headers["Authorization"] = accessToken;

  return await http.put(
      httpMethod(apiUrl, path),
      headers: headers
  );
}

Future<http.Response> deleteAuthenticated(String path) async {
  var sharedPreferences = await SharedPreferences.getInstance();

  String? accessToken = sharedPreferences.getString("access_token");
  if (accessToken == null) {
    return Future.error("Unauthenticated");
  }
  var headers = requestHeader;
  headers["Authorization"] = accessToken;

  return await http.delete(
      httpMethod(apiUrl, path),
      headers: headers
  );
}
