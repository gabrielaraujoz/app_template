import 'dart:async';

import 'package:app_template/core/di/injection_initializer.dart';
import 'package:app_template/core/firebase/firebase_initializer.dart';
import 'package:app_template/core/logger/app_error_logger.dart';
import 'package:app_template/core/logger/app_error_logger_initializer.dart';
import 'package:app_template/core/network/error_interceptor.dart';
import 'package:app_template/core/network/headers_interceptor.dart';
import 'package:app_template/my_app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  AppInitializer.init();
}

// ignore: prefer-match-file-name
class AppInitializer {
  static Future<void> init() async {
    runZonedGuarded<Future<void>>(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        await FirebaseInitializer.initialize();

        setupDependencyInjection();
        getIt<AppErrorLoggerInitializer>().initialize();
        setupDio();

        runApp(
          getIt<MyApp>(),
        );
      },
      (error, stack) {
        AppErrorLogger.e(error, stack, isFatal: true);
      },
    );
  }

  /// This is a cyclic dependency and it must stay out of the dependency setup.
  /// AuthErrorInterceptor must lock all other interceptors and also retry the
  /// requests by executing dio.request(). We believe there's an issue with the
  /// design of the lib.
  static void setupDio() {
    final dio = getIt<Dio>();
    final logoutDio = getIt<Dio>(instanceName: 'logoutDio');
    dio.interceptors
      ..add(getIt<HeadersInterceptor>())
      ..add(getIt<ErrorInterceptor>());

    logoutDio.interceptors
      ..add(getIt<HeadersInterceptor>())
      ..add(getIt<ErrorInterceptor>());

    final isDebug = getIt<bool>(instanceName: 'isDebug');
    if (isDebug) {
      dio.interceptors
          .add(getIt<Interceptor>(instanceName: 'networkLoggerInterceptor'));

      logoutDio.interceptors
          .add(getIt<Interceptor>(instanceName: 'networkLoggerInterceptor'));
    }
  }

  static void setupDioLogger() {
    getIt<Dio>().interceptors.add(getIt<HeadersInterceptor>());

    getIt<Dio>(instanceName: 'logoutDio')
        .interceptors
        .add(getIt<HeadersInterceptor>());
  }
}
