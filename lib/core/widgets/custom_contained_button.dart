import 'package:app_template/core/theme/widgets/global_app_theme.dart';
import 'package:app_template/core/tokens/dimensions.dart';
import 'package:app_template/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';

class CustomContainedButton extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final bool enabled;
  final bool hasElevation;
  final bool isLoading;
  final Widget? content;

  const CustomContainedButton({
    required this.onPressed,
    this.text,
    this.padding = const EdgeInsets.symmetric(
      vertical: Dimensions.base4,
      horizontal: Dimensions.base2,
    ),
    this.enabled = true,
    this.hasElevation = true,
    this.isLoading = false,
    this.content,
    super.key,
  }) : assert(text != null || content != null);

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      foregroundColor: GlobalAppTheme.of(context).containedButtonTextColor,
      padding: padding,
      disabledForegroundColor:
          GlobalAppTheme.of(context).containedButtonDisabledTextColor,
      disabledBackgroundColor:
          GlobalAppTheme.of(context).containedButtonDisabledColor,
      backgroundColor: GlobalAppTheme.of(context).containedButtonColor,
      elevation: hasElevation ? null : 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.borderRadiusBase),
      ),
      textStyle: GlobalAppTheme.of(context).containedButtonTextStyle,
      animationDuration: const Duration(milliseconds: 100),
    );

    return ElevatedButton(
      style: style,
      onPressed: (enabled && !isLoading) ? onPressed : null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Visibility(
            maintainAnimation: true,
            maintainSize: true,
            maintainState: true,
            visible: !isLoading,
            child: content ?? Text(text!, textAlign: TextAlign.center),
          ),
          Visibility(
            visible: isLoading,
            child: SizedBox.square(
              dimension: Dimensions.iconSize,
              child: CustomLoadingIndicator(
                color:
                    GlobalAppTheme.of(context).containedButtonDisabledTextColor,
                strokeWidth: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
