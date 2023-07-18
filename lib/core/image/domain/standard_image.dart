import 'package:equatable/equatable.dart';

class StandardImage extends Equatable {
  final String url;
  final ImageFormat format;

  const StandardImage({
    required this.url,
    required this.format,
  });

  @override
  List<Object> get props => [url, format];
}

enum ImageFormat {
  SVG,
  BITMAP,
}
