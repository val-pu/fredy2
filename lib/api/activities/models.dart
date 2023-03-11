
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Activity{
  final String description;
  final String title;
  final String uuid;
  final String groupid;
  final bool joined;
  final int memberCount;

  Activity({required this.description, required this.title, required this.uuid,
      required this.groupid, required this.joined, required this.memberCount});

  factory Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);
}

@JsonSerializable()
class CreateActivity{
  final String title, description;

  CreateActivity({required this.title, required this.description});

  Map<String, dynamic> toJson() => _$CreateActivityToJson(this);

}