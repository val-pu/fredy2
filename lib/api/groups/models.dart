
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class Group{
  final String description;
  final String name;
  final String uuid;

  Group({required this.description, required this.name, required this.uuid});

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}

@JsonSerializable()
class CreateGroup{
  final String name, description;

  CreateGroup({required this.name, required this.description});

  Map<String, dynamic> toJson() => _$CreateGroupToJson(this);

}