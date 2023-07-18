import 'package:app_template/core/extensions/string_extensions.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:app_template/core/image/domain/standard_image.dart';

part 'standard_image_response.g.dart';

@JsonSerializable()
class StandardImageResponse {
  final String url;
  final String format;

  const StandardImageResponse({
    required this.url,
    required this.format,
  });

  factory StandardImageResponse.fromJson(Map<String, dynamic> json) =>
      _$StandardImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StandardImageResponseToJson(this);

  StandardImage toDomain() => StandardImage(
        url: url,
        format: format.toSafeEnum(ImageFormat.BITMAP, ImageFormat.values)!,
      );
}
