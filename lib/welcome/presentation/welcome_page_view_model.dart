import 'package:app_template/core/navigation/navigator/app_navigator.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'welcome_page_view_model.g.dart';

@injectable
class WelcomePageViewModel extends _WelcomePageViewModelBase
    with _$WelcomePageViewModel {
  WelcomePageViewModel(
    super.navigator,
  );
}

abstract class _WelcomePageViewModelBase with Store {
  final AppNavigator _navigator;

  _WelcomePageViewModelBase(
    this._navigator,
  );

  @observable
  bool isLoadingRequest = false;
  @observable
  String? onErrorFeedback;

  @action
  void onStartButtonClicked() {
    onErrorFeedback = null;
    isLoadingRequest = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoadingRequest = false;
    });
  }
}
