import 'package:injectable/injectable.dart';
import 'package:store_redirect/store_redirect.dart';

@injectable
class StoreRedirectWrapper {
  void redirectToStore() {
    StoreRedirect.redirect(iOSAppId: '6444286024');
  }
}
