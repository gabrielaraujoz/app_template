import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:injectable/injectable.dart';

// import 'crashlytics_wrapper.dart';

@LazySingleton()
class AppErrorLogger {
  static void d(String message) {
    Fimber.d(message);
  }

  static void e(
    dynamic exception,
    StackTrace? currentStackTrace, {
    StackTrace? capturedStackTrace,
    String message = '',
    bool isFatal = false,
  }) {
    if (currentStackTrace == null || currentStackTrace == StackTrace.empty) {
      currentStackTrace = _buildCurrentStackTrace();
    }

    if (capturedStackTrace != null) {
      i(capturedStackTrace.toString());
    }
    Fimber.e(
      message,
      ex: exception,
      stacktrace: currentStackTrace,
    );
  }

  static void w(String message) {
    Fimber.w(message);
  }

  static void i(String message) {
    Fimber.i(message);
  }

  static StackTrace _buildCurrentStackTrace() {
    final stackString =
        _removeAppErrorLoggerLines(StackTrace.current.toString());
    return StackTrace.fromString(stackString);
  }

  static String _removeAppErrorLoggerLines(String stackString) {
    const loggerLinesCount = 2;
    final lines = stackString.split('\n');

    if (lines.length <= loggerLinesCount) return stackString;

    lines.removeRange(0, loggerLinesCount);
    stackString = lines.join('\n');

    return stackString.replaceAllMapped(RegExp(r'^#(\d+).*$', multiLine: true),
        (match) {
      final index = int.parse(match.group(1)!);
      final line = match.group(0);
      return line!.replaceFirst('#$index', '#${index - loggerLinesCount}');
    });
  }
}
