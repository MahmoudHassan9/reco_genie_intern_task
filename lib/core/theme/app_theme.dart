import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

abstract class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.black,
      secondary: AppColors.black,
      onSecondary: AppColors.primary,
      error: Colors.redAccent,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.primary,
    ),
    appBarTheme: AppBarTheme(centerTitle: true, titleTextStyle: TextStyle()),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
