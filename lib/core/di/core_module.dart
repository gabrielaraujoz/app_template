import 'package:app_template/core/navigation/navigator/app_navigator.dart';
import 'package:app_template/core/navigation/navigator/app_router_delegate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CoreModule {
  @LazySingleton()
  @Named('isDebug')
  bool get isDebug => kDebugMode;

  @LazySingleton()
  AppNavigator navigator(AppRouterDelegate delegate) => delegate;

  @LazySingleton()
  @Named('baseUrl')
  String get baseUrl => 'some_base_url'; //TODO: update base url

  @LazySingleton()
  @Named('remoteConfigFetchIntervalMinutes')
  int get remoteConfigFetchIntervalMinutes => 1;

  @LazySingleton()
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}
