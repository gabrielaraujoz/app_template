import 'package:flutter/material.dart';

class AppTypography {
  static const baseFont = 'Work Sans';

  static const _textStyle = TextStyle(fontFamily: baseFont);

  static final TextStyle txBody = _textStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txBodySemiBold = txBody.copyWith(
    fontWeight: FontWeight.w600,
  );

  static final TextStyle txBodyMedium = txBody.copyWith(
    fontWeight: FontWeight.w500,
  );

  static final TextStyle txBodySmall = _textStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.571,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txBodySmallMedium = txBodySmall.copyWith(
    fontWeight: FontWeight.w500,
  );

  static final TextStyle txBodySmallSemiBold = txBodySmall.copyWith(
    fontWeight: FontWeight.w600,
  );

  static final TextStyle txCaption = _textStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txCaptionMedium = txCaption.copyWith(
    fontWeight: FontWeight.w500,
  );

  static final TextStyle txSubtitle1 = _textStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txSubtitle2 = _textStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.571,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txDisplay1 = _textStyle.copyWith(
    fontSize: 48,
    fontWeight: FontWeight.w400,
    height: 1.083,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txDisplay1Bold = _textStyle.copyWith(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    height: 1.083,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txDisplay2 = _textStyle.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    height: 1.111,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txDisplay2SemiBold = _textStyle.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    height: 1.111,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txTitle1 = _textStyle.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    height: 1.214,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txTitle1SemiBold = _textStyle.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.214,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txTitle2 = _textStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 1.25,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txTitle2SemiBold = _textStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.25,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txTitle3 = _textStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.4,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txTitle3SemiBold = _textStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txTitle4 = _textStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.3,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txTitle5 = _textStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.556,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txOverline = _textStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    height: 1.6,
    letterSpacing: 1,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txOverlineSmall = _textStyle.copyWith(
    fontSize: 8,
    fontWeight: FontWeight.w600,
    height: 1.75,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txButton = _textStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.42857,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle txButtonSmall = _textStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 1.5,
    leadingDistribution: TextLeadingDistribution.even,
  );
}
