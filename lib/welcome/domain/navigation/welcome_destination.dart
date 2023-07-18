import 'package:app_template/core/di/injection_initializer.dart';
import 'package:app_template/core/navigation/destination.dart';
import 'package:app_template/welcome/presentation/welcome_page.dart';
import 'package:flutter/material.dart';

class WelcomeDestination extends Destination {
  @override
  Widget buildWidget() {
    return getIt<WelcomePage>();
  }

  @override
  List<Object> get props => [];
}
