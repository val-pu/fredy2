
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class ErrorResponse{
  String error;
  ErrorResponse({required this.error});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);

}