import 'package:flutter/material.dart';

const colorPrimary = Color(0xFF1F1D2B);
const colorSecondary = Color(0xFFFEC047);
const colorYellow = Color(0xFFF5BA46);
const colorAccent = Color(0xFF6F6FC8);
const colorGrey = Color(0xFF272635);
const colorPrimaryText = Color(0xFFCECED1);
const colorSecondaryText = Color(0xFF8F8E95);
const colorWhite = Color(0xFFFFFFFF);


class AppColors {
  final Color colorPrimary;
  final Color colorSecondary;
  final Color colorYellow;
  final Color colorAccent;
  final Color colorGrey;
  final Color colorPrimaryText;
  final Color colorSecondaryText;
  final Color colorWhite;

  AppColors(this.colorPrimary,
      this.colorSecondary,
      this.colorYellow,
      this.colorAccent,
      this.colorGrey,
      this.colorPrimaryText,
      this.colorSecondaryText,
      this.colorWhite,);
}

final _appColorLight = AppColors(
  colorPrimary,
  colorSecondary,
  colorYellow,
  colorAccent,
  colorGrey,
  colorPrimaryText,
  colorSecondaryText,
  colorWhite,
);
final _appColorDark = AppColors(
  colorPrimary,
  colorSecondary,
  colorYellow,
  colorAccent,
  colorGrey,
  colorPrimaryText,
  colorSecondaryText,
  colorWhite,
);

extension AppTheme on ThemeData {
  AppColors get appColors =>
      brightness == Brightness.light ? _appColorLight : _appColorDark;
}

extension ContextThemeExtension on BuildContext {
  bool get isLightTheme =>
      Theme
          .of(this)
          .brightness == Brightness.light;

  AppColors get appColors =>
      Theme
          .of(this)
          .appColors;
}

