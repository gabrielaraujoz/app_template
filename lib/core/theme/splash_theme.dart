import 'package:app_template/core/theme/app_theme.dart';
import 'package:flutter/services.dart';

class SplashTheme extends AppTheme {
  const SplashTheme(super.context);

  @override
  SystemUiOverlayStyle get systemUiOverlayStyle => SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      );
}
