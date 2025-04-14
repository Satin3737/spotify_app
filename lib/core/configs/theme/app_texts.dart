import 'package:flutter/material.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';

class AppTexts {
  static TextStyle titleText(
    BuildContext context, {
    double? fontSize = 24,
    double? height = 1,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color ?? (context.isDark ? AppColors.white : AppColors.black),
      height: height,
    );
  }

  static TextStyle regularText(
    BuildContext context, {
    double? fontSize = 16,
    double? height = 1.5,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color ?? (context.isDark ? AppColors.white : AppColors.black),
      fontWeight: FontWeight.w400,
      height: height,
    );
  }

  static TextStyle descriptionText({double? fontSize = 16, Color? color}) {
    return TextStyle(
      fontSize: fontSize,
      color: color ?? AppColors.grey,
      height: 1.5,
    );
  }

  static TextStyle fieldText(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: context.isDark ? AppColors.white : AppColors.black,
    );
  }
}
