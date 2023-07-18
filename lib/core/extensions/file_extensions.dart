import 'dart:io';

extension FileExtensions on File {
  bool get isImage {
    final lowerCasedPath = path.toLowerCase();
    return lowerCasedPath.endsWith('.png') ||
        lowerCasedPath.endsWith('.jpg') ||
        lowerCasedPath.endsWith('.jpeg') ||
        lowerCasedPath.endsWith('.webp');
  }

  bool get isPng => path.toLowerCase().endsWith('.png');

  bool get isPdf => path.toLowerCase().endsWith('.pdf');

  bool get isBFFSupportedFileType => isPng || isPdf;
}
