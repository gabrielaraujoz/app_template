import 'dart:async';

import 'package:app_template/core/app_version/domain/app_version_checker.dart';
import 'package:app_template/core/logger/app_error_logger.dart';
import 'package:app_template/core/navigation/destination.dart';
import 'package:app_template/core/navigation/navigator/app_navigator.dart';
import 'package:app_template/core/remote_config/remote_config_service.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'my_app_view_model.g.dart';

@LazySingleton()
class MyAppViewModel extends _MyAppViewModelBase with _$MyAppViewModel {
  MyAppViewModel(
    super.appVersionChecker,
    super.crashlyticsWrapper,
    super.remoteConfig,
  );
}

abstract class _MyAppViewModelBase with Store {
  final AppVersionChecker _appVersionChecker;
  final AppNavigator _appNavigator;
  final RemoteConfigService _remoteConfig;

  _MyAppViewModelBase(
    this._appVersionChecker,
    this._appNavigator,
    this._remoteConfig,
  );

  Future<void> onViewReady() async {
    await _initializeLibs();
  }

  @action
  Future<void> _initializeLibs() async {
    final remoteConfigInitialization = _remoteConfig.initialize();
    final splashScreenDelay =
        Future.delayed(const Duration(milliseconds: 1000));

    return Future.wait<void>([
      remoteConfigInitialization,
      splashScreenDelay,
    ]).then((value) async {
      if (await _appVersionChecker.isOutdated()) {
        _appNavigator.goToDestination(
          Destination.welcome(),
          clearStack: true,
        );
      } else {
        _appNavigator.goToDestination(
          Destination.welcome(),
          clearStack: true,
        );
      }
    }).catchError((error, stackTrace) {
      AppErrorLogger.e(
        error,
        StackTrace.current,
        capturedStackTrace: stackTrace,
      );
    });
  }
}
