import 'package:app_template/core/theme/widgets/global_app_theme.dart';
import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final Color? color;
  final double? strokeWidth;

  const CustomLoadingIndicator({this.color, this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(
        color ?? GlobalAppTheme.of(context).loadingColor,
      ),
      strokeWidth: strokeWidth ?? 4.0,
    );
  }
}
