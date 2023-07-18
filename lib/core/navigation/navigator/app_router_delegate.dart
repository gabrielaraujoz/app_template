import 'dart:async';

import 'package:app_template/core/navigation/deep_link/deep_link_router.dart';
import 'package:app_template/core/navigation/destination.dart';
import 'package:app_template/core/navigation/navigator/app_navigator.dart';
import 'package:app_template/core/navigation/navigator/result.dart';
import 'package:app_template/core/navigation/presentation/custom_fade_page.dart';
import 'package:app_template/core/navigation/transition_type.dart';
import 'package:app_template/splash/navigation/splash_destination.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppRouterDelegate extends RouterDelegate<List<Destination>>
    with ChangeNotifier
    implements AppNavigator {
  final DeepLinkRouter _deepLinkRouter;
  final List<RouterDelegate> innerDelegates = [];

  final List<Page> _pages = [];
  final _resultsStreamController = StreamController<Result>.broadcast();
  int _salt = 1;

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  bool? get canPop => _navigatorKey.currentState?.canPop();

  AppRouterDelegate(
    this._deepLinkRouter,
  ) {
    goToDestination(Destination.splash(), clearStack: true);
  }

  @override
  Future<void> goToDeepLink(
    Uri? uri, {
    bool clearStack = false,
  }) async {
    final routes = _deepLinkRouter.getDestinations(uri);
    if (currentDestination == SplashDestination() || clearStack) {
      // If there are no pages opened yet or if we want to navigate forward with a stack,
      // then it should open the deeplink with the complete stack
      goToDestinations(routes, true);
    } else {
      // If there are any pages opened then it should go only to the destination without stack
      goToDestination(routes.last, clearStack: false);
    }
  }

  @override
  void goToDestination(Destination destination, {bool clearStack = false}) {
    goToDestinations([destination], clearStack);
  }

  @override
  void replaceCurrentDestination(Destination destination) {
    _pages.removeLast();
    _pages.add(
      CustomFadePage(
        key: DestinationKey(destination, _salt),
        child: destination.buildWidget(),
      ),
    );
    notifyListeners();
  }

  /// This method will pop the top most route in the stack, be it a bottom sheet, dialog or a page.
  @override
  void pop() {
    if (canPop == true) _navigatorKey.currentState?.pop();
  }

  @override
  void goToDestinations(List<Destination> destinations, bool clearStack) {
    if (destinations.isEmpty) return;

    // _shouldReloadPage will check if the current page is the same as the one we want
    // to navigate to. If so it will remove the last page and add it
    // again to the stack with a different salt making it reload
    if (_shouldReloadPage(destinations)) {
      _pages.removeLast();
      _salt++;
    }

    if (clearStack) {
      _pages.clear();
      _salt++;
    }

    for (var destination in destinations) {
      LocalKey destinationKey = DestinationKey(destination, _salt);
      Widget pageWidget = destination.buildWidget();
      Page page;

      switch (destination.transition) {
        case TransitionType.FADE:
          page = CustomFadePage(
            key: destinationKey,
            child: pageWidget,
          );
          break;
        default:
          page = MaterialPage(
            key: destinationKey,
            child: pageWidget,
          );
      }
      _pages.add(page);
    }

    notifyListeners();
  }

  @override
  Stream<T> listenToResult<T>(Type destinationType) {
    return _resultsStreamController.stream
        .where((event) => event.destination == destinationType)
        .map((event) => event.result);
  }

  @override
  Destination get currentDestination =>
      (_pages.last.key as DestinationKey).destination;

  bool _shouldReloadPage(List<Destination> destinations) =>
      _pages.isNotEmpty &&
      _pages.last.key == DestinationKey(destinations.last, _salt);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      pages: List.unmodifiable(_pages),
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _resultsStreamController.add(Result(_lastDestinationType));
        _pages.removeLast();
        notifyListeners();
        return true;
      },
    );
  }

  @override
  // ignore: avoid_renaming_method_parameters
  Future<void> setNewRoutePath(List<Destination> destinations) async {
    goToDestinations(destinations, true);
  }

  @override
  Future<bool> popRoute() {
    if (_pages.length == 1) {
      return SynchronousFuture(false);
    } else {
      _resultsStreamController.add(Result(_lastDestinationType));
      _pages.removeLast();
      notifyListeners();
      return SynchronousFuture(true);
    }
  }

  @override
  void returnWithResult<T>(T result) {
    assert(_pages.length > 1);
    _resultsStreamController.add(Result(_lastDestinationType, result: result));
    _pages.removeLast();
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _resultsStreamController.close();
  }

  Type get _lastDestinationType =>
      (_pages.last.key as DestinationKey).destination.runtimeType;
}

class DestinationKey extends Equatable implements LocalKey {
  final Destination destination;

  //This salt is used when we want to invalidate a previous set of destinations
  //and it is used only to make this DestinationKey different from a previous
  //one.
  final int salt;

  const DestinationKey(this.destination, this.salt);

  @override
  List<Object> get props => [destination, salt];
}
