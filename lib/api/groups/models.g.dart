// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      description: json['description'] as String,
      name: json['name'] as String,
      uuid: json['uuid'] as String,
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
      'uuid': instance.uuid,
    };

CreateGroup _$CreateGroupFromJson(Map<String, dynamic> json) => CreateGroup(
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CreateGroupToJson(CreateGroup instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };
