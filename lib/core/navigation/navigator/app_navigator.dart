import 'package:app_template/core/navigation/destination.dart';

abstract class AppNavigator {
  void goToDeepLink(
    Uri? uri, {
    bool clearStack = false,
  });
  void goToDestination(Destination destination, {bool clearStack = false});
  void replaceCurrentDestination(Destination destination);
  void goToDestinations(List<Destination> destinations, bool clearStack);
  Destination get currentDestination;
  // Type should be of kind Destination
  Stream<T?> listenToResult<T>(Type destinationType);
  void returnWithResult<T>(T result);
  void pop();
  bool? get canPop;
}
