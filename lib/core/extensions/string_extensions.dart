import 'package:app_template/core/logger/app_error_logger.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/foundation.dart';

extension StringExtensions on String {
  String capitalize() => isNotEmpty ? this[0].toUpperCase() + substring(1) : '';

  T? toSafeEnum<T>(T? defaultValue, List<T?> values) {
    for (var value in values) {
      if (describeEnum(value!).toUpperCase() == toUpperCase()) return value;
    }
    AppErrorLogger.e(
      Exception('Enum: $this is not found in ${values.toString()}'),
      StackTrace.current,
    );
    return defaultValue;
  }

  /// Returns a String value without carriage returns or an empty String if it was null
  String removeLineBreaks() {
    return replaceAll('\r', '');
  }

  String removeAllNonDigits() {
    return replaceAll(RegExp('[^0-9]'), '');
  }

  String removeAllNonAlphaNumeric() {
    return replaceAll(RegExp('[^a-zA-Z0-9]'), '');
  }

  String firstCharacterToLowerCase() =>
      isNotEmpty ? this[0].toLowerCase() + substring(1) : '';

  /// Returns whether or not a String contains another String regardless of letter case;
  bool containsIgnoreCase(String other) =>
      toLowerCase().contains(other.toLowerCase());

  String camelCaseToSnakeCase() => StringUtils.camelCaseToLowerUnderscore(this);
}
