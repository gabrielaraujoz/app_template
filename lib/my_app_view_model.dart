import 'dart:async';

import 'package:app_template/core/logger/crashlytics_wrapper.dart';
import 'package:app_template/core/meta_info/meta_info.dart';
import 'package:app_template/core/navigation/destination.dart';
import 'package:app_template/core/navigation/navigator/app_navigator.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'my_app_view_model.g.dart';

@LazySingleton()
class MyAppViewModel extends _MyAppViewModelBase with _$MyAppViewModel {
  MyAppViewModel(
    super.crashlyticsWrapper,
    super.metaInfo,
    super.appNavigator,
  );
}

abstract class _MyAppViewModelBase with Store {
  final CrashlyticsWrapper _crashlyticsWrapper;
  final MetaInfo _metaInfo;
  final AppNavigator _appNavigator;

  _MyAppViewModelBase(
    this._crashlyticsWrapper,
    this._metaInfo,
    this._appNavigator,
  );

  Future<void> onViewReady() async {
    await _initializeLibs();
  }

  @action
  Future<void> _initializeLibs() async {
    return Future.delayed(
        const Duration(milliseconds: 1000),
        () => _appNavigator.goToDestination(
              Destination.welcome(),
              clearStack: true,
            ));
  }
}
