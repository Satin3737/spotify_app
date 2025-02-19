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

  static _inputDecorationTheme(borderColor) {
    final borderRadius = BorderRadius.circular(32);

    return InputDecorationTheme(
      hintStyle: const TextStyle(
        color: AppColors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      labelStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.grey,
        fontWeight: FontWeight.w500,
      ),
      floatingLabelStyle: const TextStyle(
        color: AppColors.primary,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 28,
        horizontal: 24,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: borderColor,
          width: 1,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: borderColor,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: AppColors.primary,
          width: 1,
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
    inputDecorationTheme: _inputDecorationTheme(AppColors.black),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(
          backgroundColor: AppColors.lightBg,
        ),
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(
          backgroundColor: AppColors.lightBg,
        ),
      },
    ),
  );

  static final darkTheme = _baseTheme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBg,
    textButtonTheme: _textButtonTheme(AppColors.white),
    inputDecorationTheme: _inputDecorationTheme(AppColors.white),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(
          backgroundColor: AppColors.darkBg,
        ),
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(
          backgroundColor: AppColors.darkBg,
        ),
      },
    ),
  );
}
