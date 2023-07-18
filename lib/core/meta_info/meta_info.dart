import 'dart:io';

import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

@LazySingleton()
class MetaInfo {
  Future<String> get appVersionName => PackageInfo.fromPlatform().then((value) {
        return value.version;
      });

  String get platform => Platform.operatingSystem;

  Future<String> get timezone => FlutterNativeTimezone.getLocalTimezone();

  bool get isAndroid => Platform.isAndroid;

  Future<String> get appName => PackageInfo.fromPlatform().then((value) => value.appName);
}
