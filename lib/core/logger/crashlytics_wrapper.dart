import 'package:app_template/core/logger/app_error_logger.dart';
import 'package:fimber/fimber.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show FlutterError;
import 'package:injectable/injectable.dart';

@LazySingleton()
class CrashlyticsWrapper implements LogTree {
  final bool isDebug;

  CrashlyticsWrapper(
    @Named('isDebug') this.isDebug,
  );

  void initialize() {
    if (isDebug) {
      FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      FlutterError.onError = (error) {
        if (isDebug) {
          AppErrorLogger.e(error, error.stack);
        } else {
          FirebaseCrashlytics.instance.recordFlutterFatalError(error);
        }
      };
    }
  }

  void setUserId(String id) {
    FirebaseCrashlytics.instance.setUserIdentifier(id);
  }

  @override
  List<String> getLevels() {
    return ['I', 'E'];
  }

  @override
  void log(
    String level,
    String message, {
    String? tag,
    dynamic ex,
    StackTrace? stacktrace,
  }) {
    if (level == 'D') return;
    if (level == 'I') {
      FirebaseCrashlytics.instance.log(message);
    } else {
      FirebaseCrashlytics.instance.recordError(
        ex.exception,
        stacktrace,
        reason: message,
      );
    }
  }
}
