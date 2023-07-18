import 'package:app_template/core/navigation/transition_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'destination_index.dart';

abstract class Destination extends Equatable {
  Widget buildWidget();

  final TransitionType transition = TransitionType.DEFAULT;

  // This constructor is needed by the destinations that extend Destination but
  // it shouldn't be used directly
  const Destination();

  factory Destination.splash() => SplashDestination();

  factory Destination.welcome() => WelcomeDestination();
}
