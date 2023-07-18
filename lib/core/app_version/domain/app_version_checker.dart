import 'package:app_template/core/meta_info/meta_info.dart';
import 'package:app_template/core/remote_config/remote_config_keys.dart';
import 'package:app_template/core/remote_config/remote_config_service.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AppVersionChecker {
  final RemoteConfigService _remoteConfig;
  final MetaInfo _metaInfo;

  AppVersionChecker(
    this._remoteConfig,
    this._metaInfo,
  );

  Future<bool> isOutdated() {
    final minVersion =
        _remoteConfig.getString(RemoteConfigKeys.minimumAppVersion);
    return _isCurrentVersionOutdated(minVersion);
  }

  Future<bool> hasAvailableUpdate() {
    final latestVersion =
        _remoteConfig.getString(RemoteConfigKeys.latestAppVersion);
    return _isCurrentVersionOutdated(latestVersion);
  }

  Future<bool> _isCurrentVersionOutdated(targetVersion) async {
    final currentVersion = await _metaInfo.appVersionName;
    final currentVersionArray = currentVersion.split('-').first.split('.');
    final targetVersionArray = targetVersion.split('.');

    for (var i = 0; i <= 2; i++) {
      final currentNumber = int.parse(currentVersionArray[i]);
      final targetNumber = int.parse(targetVersionArray[i]);

      if (currentNumber == targetNumber) continue;
      return currentNumber < targetNumber;
    }

    return false;
  }
}
