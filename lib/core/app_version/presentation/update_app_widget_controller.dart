import 'package:app_template/core/store_redirect/store_redirect_wrapper.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateAppWidgetController {
  final StoreRedirectWrapper _storeRedirect;

  const UpdateAppWidgetController(
    this._storeRedirect,
  );

  void onUpdateButtonPressed() {
    _storeRedirect.redirectToStore();
  }
}
