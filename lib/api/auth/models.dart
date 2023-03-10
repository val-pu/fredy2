import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginModel {
  final String accessToken;
  final String refreshToken;
  final String username;
  @JsonKey(name: "uuid")
  final String userId;
  final DateTime accessTokenExpires;
  final DateTime refreshTokenExpires;

  LoginModel(
      {required this.accessToken,
        required this.refreshToken,
        required this.username,
        required this.userId,
        required this.accessTokenExpires,
        required this.refreshTokenExpires});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}