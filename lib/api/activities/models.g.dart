// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      description: json['description'] as String,
      title: json['title'] as String,
      uuid: json['uuid'] as String,
      groupid: json['groupid'] as String,
      joined: json['joined'] as bool,
      memberCount: json['member_count'] as int,
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'description': instance.description,
      'title': instance.title,
      'uuid': instance.uuid,
      'groupid': instance.groupid,
      'joined': instance.joined,
      'member_count': instance.memberCount,
    };

CreateActivity _$CreateActivityFromJson(Map<String, dynamic> json) =>
    CreateActivity(
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CreateActivityToJson(CreateActivity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };
