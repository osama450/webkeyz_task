import 'package:flutter/material.dart';
import 'colors.dart';

abstract class AppTheme {
  static const String fontFamily = 'Poppins';
  static ThemeData main = ThemeData(
    scrollbarTheme: const ScrollbarThemeData().copyWith(
      thumbColor: MaterialStateProperty.all(
        AppColors.primaryColor,
      ),
    ),
    splashColor: AppColors.primaryColor,
    highlightColor: AppColors.primaryColor,
    primaryColor: AppColors.primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: fontFamily,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}
