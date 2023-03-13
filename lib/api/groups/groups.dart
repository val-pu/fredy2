import 'dart:convert';

import 'package:fredy2/api/api.dart';
import 'package:fredy2/api/models.dart';
import 'models.dart';

Future<List<Group>> getGroups() async {
  final resp = await getAuthenticated("groups");
  if (resp.statusCode != 200) {
    return Future.error(ErrorResponse.fromJson(jsonDecode(resp.body)).error);
  }
  List<dynamic> groups = jsonDecode(resp.body)["groups"];
  return groups.map((e) => Group.fromJson(e)).toList();
}

Future<Group> createGroup(String name, String description) async {
  final group = CreateGroup(name: name, description: description).toJson();
  final resp = await postAuthenticated(group, "groups");
  if (resp.statusCode != 201) {
    return Future.error(ErrorResponse.fromJson(jsonDecode(resp.body)).error);
  }
  return Group.fromJson(jsonDecode(resp.body));
}

Future<void> joinGroup(String invitation)async {
  final resp = await postAuthenticated(null, "groups/join/$invitation");
  if (resp.statusCode != 200){
    return Future.error(ErrorResponse.fromJson(jsonDecode(resp.body)).error);
  }
}