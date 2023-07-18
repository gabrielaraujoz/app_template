import 'package:app_template/core/logger/app_error_logger.dart';
import 'package:app_template/core/remote_config/remote_config_key.dart';
import 'package:app_template/core/remote_config/remote_config_keys.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RemoteConfigService {
  int remoteConfigFetchIntervalMinutes;

  RemoteConfigService({
    @Named('remoteConfigFetchIntervalMinutes')
        required this.remoteConfigFetchIntervalMinutes,
  });

  late FirebaseRemoteConfig _remoteConfig;

  Future<bool> initialize() async {
    try {
      _remoteConfig = FirebaseRemoteConfig.instance;
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          minimumFetchInterval:
              Duration(minutes: remoteConfigFetchIntervalMinutes),
          fetchTimeout: const Duration(minutes: 1),
        ),
      );
      await _setDefaults();

      await _remoteConfig.fetchAndActivate();
    } on FirebaseException catch (exception, stackTrace) {
      AppErrorLogger.e(
        exception,
        StackTrace.current,
        capturedStackTrace: stackTrace,
        message: '${exception.code}: ${exception.message}',
      );
      return false;
    } catch (exception, stackTrace) {
      AppErrorLogger.e(
        exception,
        StackTrace.current,
        capturedStackTrace: stackTrace,
        message:
            'Unable to fetch remote config. Cached or default values will be used',
      );
      return false;
    }

    return true;
  }

  Future<bool> refetch() => _remoteConfig.fetchAndActivate();

  String getString(RemoteConfigKey key) => _remoteConfig.getString(key.name);

  bool getBool(RemoteConfigKey key) => _remoteConfig.getBool(key.name);

  double getDouble(RemoteConfigKey key) => _remoteConfig.getDouble(key.name);

  int getInt(RemoteConfigKey key) => _remoteConfig.getInt(key.name);

  List<String> getKeys() => _remoteConfig.getAll().keys.toList();

  Map<String, String> getAll() => _remoteConfig
      .getAll()
      .map((key, value) => MapEntry(key, value.asString()));

  Future<void> _setDefaults() {
    final defaults = {
      for (var item in RemoteConfigKeys.all) (item).name: item.defaultValue,
    };
    return _remoteConfig.setDefaults(defaults);
  }
}
