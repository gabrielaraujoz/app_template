import 'package:app_template/core/di/injection_initializer.dart';
import 'package:app_template/core/navigation/destination.dart';
import 'package:app_template/minimum_version/minimum_version_page.dart';
import 'package:flutter/material.dart';

class MinimumVersionDestination extends Destination {
  @override
  Widget buildWidget() {
    return getIt<MinimumVersionPage>();
  }

  @override
  List<Object> get props => [];
}
