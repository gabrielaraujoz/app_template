import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    as secure_storage;
import 'package:injectable/injectable.dart';

import 'destination_keys.dart';

@LazySingleton()
class DestinationRepository {
  final secure_storage.FlutterSecureStorage storage;

  DestinationRepository(this.storage);

  void setRedirectDeepLinkUri(Uri? deepLink) {
    setRedirectDeepLink(deepLink.toString());
  }

  void setRedirectDeepLink(String deepLink) {
    storage.write(key: DestinationKeys.REDIRECT_DEEP_LINK, value: deepLink);
  }

  Future<Uri?> consumeRedirectDeepLink() async {
    final deepLink =
        await storage.read(key: DestinationKeys.REDIRECT_DEEP_LINK);
    if (deepLink != null) {
      clearRedirectDeeplink();
      return Uri.parse(deepLink);
    }
    return null;
  }

  void clearRedirectDeeplink() {
    storage.write(key: DestinationKeys.REDIRECT_DEEP_LINK, value: null);
  }
}
