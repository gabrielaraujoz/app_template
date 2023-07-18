import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse {
  final String? error;
  @JsonKey(name: 'error_description')
  final String? errorDescription;
  final Map<String, String>? causes;

  ErrorResponse(
    this.error,
    this.errorDescription,
    this.causes,
  );

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}
