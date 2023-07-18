import 'package:flutter/material.dart';

/// This widget controls if it should be dark mode or not. Because of that, it should only be used once
/// and it should be placed as one of the first widgets of the app.
class DarkModeThemeSetter extends InheritedWidget {
  final bool darkMode;

  // ignore: use_key_in_widget_constructors
  const DarkModeThemeSetter({
    required this.darkMode,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant DarkModeThemeSetter oldWidget) {
    return darkMode != oldWidget.darkMode;
  }

  static DarkModeThemeSetter of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: DarkModeThemeSetter)!;
}
