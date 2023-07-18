import 'package:app_template/core/theme/app_theme.dart';
import 'package:app_template/core/theme/widgets/global_app_theme.dart';
import 'package:flutter/material.dart';

/// ReveloTheme is a convenience widget to build a tree of widgets with the right [BuildContext]
/// object that is able to fetch the closest theme settings.
///
/// It is alright to use nested themes if necessary.
///
/// In order to access the theming variables, simply call Theme.of(context) and access the
/// [AppTheme] variables.
class ThemeWrapper extends StatelessWidget {
  final AppTheme theme;
  final WidgetBuilder builder;

  const ThemeWrapper({
    required this.theme,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalAppTheme(
      theme: theme,
      child: Builder(builder: builder),
    );
  }
}
