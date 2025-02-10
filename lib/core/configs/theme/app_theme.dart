import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';

class AppTheme {
  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      minimumSize: const Size(double.infinity, 72),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      textStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
    ),
  );

  static final _baseTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    elevatedButtonTheme: _elevatedButtonTheme,
    fontFamily: 'Satoshi',
  );

  static final lightTheme = _baseTheme.copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBg,
  );

  static final darkTheme = _baseTheme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBg,
  );
}
