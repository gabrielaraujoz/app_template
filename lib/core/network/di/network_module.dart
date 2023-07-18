import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @LazySingleton()
  Dio dio(
    @Named('baseUrl') String baseUrl,
    @Named('isDebug') bool isDebug,
  ) {
    final dio = Dio()
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _timeoutDuration
      ..options.receiveTimeout = _timeoutDuration
      ..options.sendTimeout = _timeoutDuration;

    return dio;
  }

  @LazySingleton()
  @Named('logoutDio')
  Dio logoutDio(
    @Named('baseUrl') String baseUrl,
    @Named('isDebug') bool isDebug,
  ) {
    final dio = Dio()
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _timeoutDuration
      ..options.receiveTimeout = _timeoutDuration
      ..options.sendTimeout = _timeoutDuration;

    return dio;
  }
}

const _timeoutDuration = Duration(seconds: 20);
