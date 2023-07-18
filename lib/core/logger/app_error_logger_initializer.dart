import 'package:app_template/core/logger/crashlytics_wrapper.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppErrorLoggerInitializer {
  final CrashlyticsWrapper crashlyticsWrapper;
  final LogTree debugTree;
  final bool isDebug;

  AppErrorLoggerInitializer({
    required this.crashlyticsWrapper,
    @Named('debugTree') required this.debugTree,
    @Named('isDebug') required this.isDebug,
  });

  void initialize() {
    crashlyticsWrapper.initialize();

    if (isDebug) {
      Fimber.plantTree(debugTree);
    } else {
      Fimber.plantTree(crashlyticsWrapper);
    }
  }
}
