import 'dart:core';

import 'package:dio/dio.dart';

class AppError extends DioException {
  final ErrorType _errorType;
  @override
  // ignore: overridden_fields
  final String? error;
  @override
  // ignore: overridden_fields
  final String message;
  final Map<String, String>? causes;
  final int? statusCode;
  final dynamic exception;

  AppError(
    this._errorType, {
    this.error,
    this.message = '',
    required this.statusCode,
    this.causes,
    this.exception,
    required super.requestOptions,
  });

  bool get isNetworkError => _errorType == ErrorType.network;

  bool get shouldLogError => !(isNetworkError);

  @override
  String toString() {
    if (exception != null) {
      if (exception.runtimeType == FormatException) {
        final formatException = exception as FormatException;
        return 'AppError [$_errorType]\n | exception: $exception\n | responseBody: "${formatException.source}"';
      } else {
        return 'AppError [$_errorType] | exception: $exception';
      }
    } else {
      if (isNetworkError) {
        return 'AppError [$_errorType]';
      } else {
        return 'AppError [$_errorType] | message: $message '
            '| statusCode: $statusCode | exception: $exception';
      }
    }
  }
}

enum ErrorType { network, generic }
