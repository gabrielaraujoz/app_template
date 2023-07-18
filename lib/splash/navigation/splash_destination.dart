import 'package:app_template/core/di/injection_initializer.dart';
import 'package:app_template/core/navigation/destination.dart';
import 'package:app_template/splash/presentation/splash_page.dart';
import 'package:flutter/material.dart';

class SplashDestination extends Destination {
  @override
  Widget buildWidget() {
    return getIt<SplashPage>();
  }

  @override
  List<Object> get props => [];
}
