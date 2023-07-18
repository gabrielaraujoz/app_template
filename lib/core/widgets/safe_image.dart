import 'dart:io';

import 'package:app_template/core/image/domain/standard_image.dart';
import 'package:app_template/core/logger/app_error_logger.dart';
import 'package:app_template/core/tokens/dimensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SafeImage extends StatelessWidget {
  final String? assetName;
  final bool keepAssetOriginalSize;
  final StandardImage? image;
  final Color? color;
  final Size? size;
  final BorderRadius? borderRadius;
  final String? semanticsLabel;

  const SafeImage({
    this.assetName,
    this.keepAssetOriginalSize = false,
    this.image,
    this.color,
    this.size,
    this.borderRadius,
    this.semanticsLabel,
  }) : assert(
          (assetName != null && image == null) ||
              (assetName == null && image != null),
        );

  @override
  Widget build(BuildContext context) {
    try {
      Widget content;
      if (assetName != null) {
        final isBitmap = assetName!.endsWith('.png');
        if (isBitmap) {
          content = Image.asset(
            'assets/images/$assetName',
            width:
                keepAssetOriginalSize ? null : size?.width ?? Dimensions.base6,
            height:
                keepAssetOriginalSize ? null : size?.height ?? Dimensions.base6,
            color: color,
            semanticLabel: semanticsLabel,
          );
        } else {
          content = SvgPicture.asset(
            'assets/images/$assetName.svg',
            width:
                keepAssetOriginalSize ? null : size?.width ?? Dimensions.base6,
            height:
                keepAssetOriginalSize ? null : size?.height ?? Dimensions.base6,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
            semanticsLabel: semanticsLabel,
          );
        }
      } else {
        if (image!.format == ImageFormat.SVG) {
          content = SvgPicture.network(
            image!.url,
            width: size?.width,
            height: size?.height,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
            fit: BoxFit.cover,
            semanticsLabel: semanticsLabel,
          );
        } else {
          content = CachedNetworkImage(
            imageUrl: image!.url,
            width: size?.width,
            height: size?.height,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 50),
            errorWidget: (context, url, error) {
              AppErrorLogger.e(
                error,
                StackTrace.current,
                message: 'Failed to load image from url: $url',
              );
              return const SizedBox.shrink();
            },
            errorListener: (e) {
              if (e is SocketException) {
                AppErrorLogger.e(
                  e,
                  StackTrace.current,
                  message:
                      'Error with ${e.address?.host} and message ${e.message}',
                );
              } else {
                AppErrorLogger.e(
                  e,
                  StackTrace.current,
                  message: 'Image Exception is: ${e.runtimeType}',
                );
              }
            },
          );
        }
      }
      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: content,
      );
    } catch (e, stackTrace) {
      AppErrorLogger.e(
        e,
        StackTrace.current,
        capturedStackTrace: stackTrace,
      );
      return const SizedBox.shrink();
    }
  }
}
