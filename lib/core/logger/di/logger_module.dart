import 'package:dio/dio.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:injectable/injectable.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';

@module
abstract class LoggerModule {
  @LazySingleton()
  @Named('debugTree')
  LogTree get logTree => DebugTree(
        useColors: true,
      );

  @LazySingleton()
  @Named('networkLoggerInterceptor')
  Interceptor get httpFormatter => AwesomeDioInterceptor();
}
