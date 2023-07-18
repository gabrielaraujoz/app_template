import 'package:app_template/core/remote_config/remote_config_key.dart';

class RemoteConfigKeys {
  static const RemoteConfigKey minimumAppVersion = RemoteConfigKey(
    'minimum_app_version',
    '0.0.0',
  );

  static const RemoteConfigKey latestAppVersion = RemoteConfigKey(
    'latest_app_version',
    '0.0.0',
  );

  static const RemoteConfigKey allowedWebviewDomains = RemoteConfigKey(
    'allowed_webview_url_domains',
    'google.com,facebook.com,linkedin.com',
  );

  // All keys must be added here
  static final List<RemoteConfigKey> all = [
    minimumAppVersion,
    latestAppVersion,
    allowedWebviewDomains,
  ];
}
