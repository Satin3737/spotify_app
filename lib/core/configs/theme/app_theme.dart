import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';

class AppTheme {
  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      minimumSize: const Size(double.infinity, 72),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      textStyle: const TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
    ),
  );

  static _textButtonTheme(Color color) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: const Size(double.infinity, 72),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
        foregroundColor: color,
        textStyle: TextStyle(
          color: color,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static final _baseTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    elevatedButtonTheme: _elevatedButtonTheme,
    fontFamily: 'Satoshi',
  );

  static final lightTheme = _baseTheme.copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBg,
    textButtonTheme: _textButtonTheme(AppColors.black),
  );

  static final darkTheme = _baseTheme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBg,
    textButtonTheme: _textButtonTheme(AppColors.white),
  );
}
