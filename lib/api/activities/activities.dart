import 'dart:convert';

import 'package:fredy2/api/api.dart';
import 'package:fredy2/api/models.dart';
import 'models.dart';

Future<List<Activity>> getActivitiesForGroup(String groupID) async {
  final resp = await getAuthenticated("groups/$groupID/activities");
  if (resp.statusCode != 200) {
    return Future.error(ErrorResponse.fromJson(jsonDecode(resp.body)).error);
  }

  List<Map<String, dynamic>> activities = jsonDecode(resp.body)[groupID];
  return activities.map((e) => Activity.fromJson(e)).toList();
}

Future<void> createActivity(
    String title, String description, String groupId) async {
  final group = CreateActivity(title: title, description: description).toJson();
  final resp = await postAuthenticated(group, "groups/$groupId/activities");
  if (resp.statusCode != 201) {
    return Future.error(ErrorResponse.fromJson(jsonDecode(resp.body)).error);
  }
}

Future<void> joinActivity(String activityId) async {
  final resp = await postAuthenticated(null, "activities/$activityId/join");
  if (resp.statusCode != 200) {
    return Future.error(ErrorResponse.fromJson(jsonDecode(resp.body)).error);
  }
}
