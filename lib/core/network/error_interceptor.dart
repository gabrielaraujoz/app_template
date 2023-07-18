import 'dart:io';

import 'package:app_template/core/error/data/error_response.dart';
import 'package:app_template/core/error/domain/app_error.dart';
import 'package:app_template/core/logger/app_error_logger.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// This interceptor converts the DioException object to a AppError.
///
/// IMPORTANT: This interceptor must be the last interceptor to be added, otherwise the errors and
/// the stackTrace might not be delivered as expected.
@LazySingleton()
class ErrorInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.badResponse) {
      AppErrorLogger.i('Error on ${err.requestOptions.path}');

      if (err.response?.data == null ||
          err.response!.data.toString().isEmpty == true) {
        return handler.next(
          AppError(
            ErrorType.generic,
            statusCode: err.response?.statusCode,
            requestOptions: err.requestOptions,
          ),
        );
      }
      try {
        final errorResponse = ErrorResponse.fromJson(err.response?.data);
        return handler.next(
          AppError(
            ErrorType.generic,
            error: errorResponse.error,
            message: errorResponse.errorDescription ?? '',
            causes: errorResponse.causes,
            statusCode: err.response?.statusCode,
            requestOptions: err.requestOptions,
          ),
        );
      } catch (error, stackTrace) {
        AppErrorLogger.e(
          error,
          stackTrace,
          message:
              'error while converting error object for url: ${err.requestOptions.path}',
        );
        return handler.next(
          AppError(
            ErrorType.generic,
            statusCode: err.response?.statusCode,
            requestOptions: err.requestOptions,
          ),
        );
      }
    } else if (err.type == DioExceptionType.unknown) {
      if (err.error is SocketException) {
        return handler.next(
          AppError(
            ErrorType.network,
            statusCode: err.response?.statusCode,
            requestOptions: err.requestOptions,
          ),
        );
      } else {
        AppErrorLogger.i('Error on ${err.requestOptions.path}');

        return handler.next(
          AppError(
            ErrorType.generic,
            exception: err.error,
            statusCode: err.response?.statusCode,
            requestOptions: err.requestOptions,
          ),
        );
      }
    } else {
      handler.next(
        AppError(
          ErrorType.network,
          statusCode: err.response?.statusCode,
          requestOptions: err.requestOptions,
        ),
      );
    }
  }
}
