// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      username: json['username'] as String,
      userId: json['uuid'] as String,
      accessTokenExpires:
          DateTime.parse(json['access_token_expires'] as String),
      refreshTokenExpires:
          DateTime.parse(json['refresh_token_expires'] as String),
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'username': instance.username,
      'uuid': instance.userId,
      'access_token_expires': instance.accessTokenExpires.toIso8601String(),
      'refresh_token_expires': instance.refreshTokenExpires.toIso8601String(),
    };
