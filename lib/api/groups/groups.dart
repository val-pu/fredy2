
import 'dart:convert';

import 'package:fredy2/api/api.dart';
import 'package:http/http.dart' as http;
import 'models.dart';

Future<List<Group>> getGroups() async {

  http.Response resp = await getAuthenticated("groups");
  if (resp.statusCode != 200){
    return Future.error("Can't fetch groups");
  }

  List<Map<String, dynamic>> groups = jsonDecode(resp.body)["groups"];
  return groups.map((e) => Group.fromJson(e)).toList();
}
