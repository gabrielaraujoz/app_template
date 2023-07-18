import 'package:app_template/core/theme/app_theme.dart';
import 'package:flutter/widgets.dart';

/// Theme is an inherited widget used to hold the [AppTheme] info for the descendants of this tree.
/// Prefer using the [ThemeWrapper] widget, otherwise it'd be necessary to use both the [GlobalAppTheme] widget
/// and a [Builder] in order to get the right context.
///
/// There must be a [GlobalAppTheme] ancestor in order to use this app.
class GlobalAppTheme extends InheritedWidget {
  final AppTheme theme;

  const GlobalAppTheme({
    required this.theme,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant GlobalAppTheme oldWidget) {
    return oldWidget.theme != theme;
  }

  static AppTheme of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<GlobalAppTheme>(
            aspect: GlobalAppTheme,
          )
          ?.theme ??
      AppTheme(context);

  static T ofType<T>(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<GlobalAppTheme>(
      aspect: GlobalAppTheme,
    );
    assert(
      result?.theme is T,
      'Theme of type $T not found in the Widget tree.',
    );
    return result!.theme as T;
  }
}
