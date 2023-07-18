import 'package:app_template/core/theme/widgets/dark_mode_theme_setter.dart';
import 'package:app_template/core/tokens/app_colors.dart';
import 'package:app_template/core/tokens/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// This is the base class for every theme in the application. If you come to need to create
/// an additional theme, simply extend it and override the necessary variables.
///
/// There must be a [DarkModeThemeSetter] ancestor in order to fetch the darkMode.
class AppTheme {
  final BuildContext context;

  /// This should ONLY be used in specific cases in which, for example, there's not a
  /// GlobalAppTheme available on the tree.
  final bool? manualDarkMode;

  const AppTheme(this.context, {this.manualDarkMode});

  bool get darkMode =>
      manualDarkMode ?? DarkModeThemeSetter.of(context).darkMode;

  SystemUiOverlayStyle get systemUiOverlayStyle =>
      (darkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark)
          .copyWith(
        statusBarColor: statusBarColor,
      );

  Color get statusBarColor => AppColors.neutralBlank;

  /// Colors
  Color get primaryColor => AppColors.tealBase;

  Color get primaryLight01 => AppColors.tealLight01;

  Color get primaryLight02 => AppColors.tealLight02;

  Color get primaryLight03 => AppColors.tealLight03;

  Color get primaryLight04 => AppColors.tealLight04;

  Color get primaryDark01 => AppColors.tealDark01;

  Color get primaryDark02 => AppColors.tealDark02;

  Color get secondaryColor => AppColors.salmonBase;

  Color get secondaryLight01 => AppColors.salmonLight01;

  Color get secondaryLight02 => AppColors.salmonLight02;

  Color get secondaryLight03 => AppColors.salmonLight03;

  Color get secondaryDark01 => AppColors.salmonDark01;

  Color get secondaryDark02 => AppColors.salmonDark02;

  Color get surfaceColor => AppColors.neutralBlank;

  Color get surfaceTransparent => AppColors.neutralBlankTransparent;

  Color get surfaceOverlayColor => AppColors.neutralBlank60;

  Color get highContrastColor => AppColors.neutralDark01;

  Color get mediumContrastColor => AppColors.neutralLight01;

  Color get lowContrastColor => AppColors.neutralLight02;

  Color get hintTextColor => lowContrastColor;

  Color get disabledTextColor => lowContrastColor;

  Color get disabledComponentColor => AppColors.neutralLight03;

  Color get disabledTextInputColor => AppColors.disabledColor;

  Color get featuredColor => primaryColor;

  Color get loadingColor => AppColors.neutralDark01;

  Color get dividerColor => AppColors.neutralLight04;

  Color get splashColor => AppColors.tealBase50;

  Color get errorColor => AppColors.errorBase;

  Color get warningColor => AppColors.warningBase;

  Color get successColor => AppColors.successBase;

  Color get notificationSurfaceColor => secondaryColor;

  Color get notificationTextColor => AppColors.neutralBlank;

  Color get shadowColor => AppColors.neutralBase60;

  Color get linkColor => AppColors.tealDark01;

  Color get containedButtonColor => AppColors.neutralDark02;

  Color get containedButtonDisabledColor => AppColors.disabledColor;

  Color get containedButtonTextColor => AppColors.neutralBlank;

  Color get containedButtonDisabledTextColor => lowContrastColor;

  Color get outlinedButtonColor => AppColors.neutralDark01;

  Color get textButtonColor => AppColors.tealDark01;

  Color get iconButtonColor => AppColors.tealDark01;

  Color get headerColor => AppColors.neutralBlank;

  /// Typography
  TextStyle get txBody =>
      AppTypography.txBody.copyWith(color: highContrastColor);

  TextStyle get txBodyMediumEmphasis =>
      txBody.copyWith(color: mediumContrastColor);

  TextStyle get txBodyLowEmphasis => txBody.copyWith(color: lowContrastColor);

  TextStyle get txBodyDisabled => txBody.copyWith(color: disabledTextColor);

  TextStyle get txBodyHe =>
      AppTypography.txBodySemiBold.copyWith(color: highContrastColor);

  TextStyle get txBodyHeDisabled =>
      AppTypography.txBodySemiBold.copyWith(color: disabledTextColor);

  TextStyle get txBodySmall =>
      AppTypography.txBodySmall.copyWith(color: highContrastColor);

  TextStyle get txBodySmallMediumEmphasis =>
      txBodySmall.copyWith(color: mediumContrastColor);

  TextStyle get txBodySmallDisabled =>
      txBodySmall.copyWith(color: disabledTextColor);

  TextStyle get txBodySmallHe =>
      AppTypography.txBodySmallSemiBold.copyWith(color: highContrastColor);

  TextStyle get txBodySmallHeMediumEmphasis =>
      AppTypography.txBodySmallSemiBold.copyWith(color: mediumContrastColor);

  TextStyle get txBodySmallHeDisabled =>
      AppTypography.txBodySmallSemiBold.copyWith(color: disabledTextColor);

  TextStyle get txOverline =>
      AppTypography.txOverline.copyWith(color: highContrastColor);

  TextStyle get txOverlineMediumEmphasis =>
      txOverline.copyWith(color: mediumContrastColor);

  TextStyle get txOverlineSmall =>
      AppTypography.txOverlineSmall.copyWith(color: highContrastColor);

  TextStyle get txOverlineSmallMediumEmphasis =>
      AppTypography.txOverlineSmall.copyWith(color: mediumContrastColor);

  TextStyle get txCaption =>
      AppTypography.txCaption.copyWith(color: highContrastColor);

  TextStyle get txCaptionHe =>
      AppTypography.txCaptionMedium.copyWith(color: highContrastColor);

  TextStyle get txCaptionMediumEmphasis =>
      txCaption.copyWith(color: mediumContrastColor);

  TextStyle get txSubtitle1 =>
      AppTypography.txSubtitle1.copyWith(color: highContrastColor);

  TextStyle get txSubtitle1MediumEmphasis =>
      txSubtitle1.copyWith(color: mediumContrastColor);

  TextStyle get txSubtitle2 =>
      AppTypography.txSubtitle2.copyWith(color: highContrastColor);

  TextStyle get txSubtitle2MediumEmphasis =>
      txSubtitle2.copyWith(color: mediumContrastColor);

  TextStyle get txDisplay1He =>
      AppTypography.txDisplay1Bold.copyWith(color: highContrastColor);

  TextStyle get txDisplay1 =>
      AppTypography.txDisplay1.copyWith(color: highContrastColor);

  TextStyle get txDisplay2He =>
      AppTypography.txDisplay2SemiBold.copyWith(color: highContrastColor);

  TextStyle get txDisplay2 =>
      AppTypography.txDisplay2.copyWith(color: highContrastColor);

  TextStyle get txTitle1He =>
      AppTypography.txTitle1SemiBold.copyWith(color: highContrastColor);

  TextStyle get txTitle1 =>
      AppTypography.txTitle1.copyWith(color: highContrastColor);

  TextStyle get txTitle2He =>
      AppTypography.txTitle2SemiBold.copyWith(color: highContrastColor);

  TextStyle get txTitle2HeLowEmphasis =>
      AppTypography.txTitle2SemiBold.copyWith(color: lowContrastColor);

  TextStyle get txTitle2 =>
      AppTypography.txTitle2.copyWith(color: highContrastColor);

  TextStyle get txTitle3He =>
      AppTypography.txTitle3SemiBold.copyWith(color: highContrastColor);

  TextStyle get txTitle3 =>
      AppTypography.txTitle3.copyWith(color: highContrastColor);

  TextStyle get txTitle3MediumEmphasis =>
      AppTypography.txTitle3.copyWith(color: mediumContrastColor);

  TextStyle get txTitle4 =>
      AppTypography.txTitle4.copyWith(color: highContrastColor);

  TextStyle get txTitle5 =>
      AppTypography.txTitle5.copyWith(color: highContrastColor);

  TextStyle get txButton =>
      AppTypography.txButton.copyWith(color: highContrastColor);

  TextStyle get txButtonDisabled =>
      AppTypography.txButton.copyWith(color: disabledTextColor);

  TextStyle get containedButtonTextStyle => AppTypography.txButton;

  TextStyle get outlinedButtonTextStyle =>
      AppTypography.txButton.copyWith(color: outlinedButtonColor);

  TextStyle get textButtonTextStyle =>
      AppTypography.txButton.copyWith(color: textButtonColor);

  TextStyle get textButtonSmallTextStyle =>
      AppTypography.txButtonSmall.copyWith(color: textButtonColor);
}
