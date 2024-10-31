import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocap/core/constants/app_colors.dart';

enum FontFamily {
  poppins('Poppins'),
  pyidaungsu('Pyidaungsu');

  const FontFamily(this.value);

  final String value;
}

enum FontSize {
  s10(10),
  s12(12),
  s13(13),
  s14(14),
  s15(15),
  s16(16),
  s18(18),
  s20(20),
  s22(22),
  s24(24),
  s28(28),
  s34(34);

  const FontSize(this.value);

  final double value;
}

class AppFontStyle {
  const AppFontStyle(this.context);
  final BuildContext context;

  TextStyle? customFont({
    FontFamily fontFamily = FontFamily.poppins,
    FontSize fontSize = FontSize.s14,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
  }) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontFamily: fontFamily.value,
      fontSize: fontSize.value,
      fontWeight: fontWeight,
      color : color,
    );
  }
}

extension ContextLocaleExtension on BuildContext {
  AppFontStyle get appFonts => AppFontStyle(this);
}
