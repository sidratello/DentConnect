import 'package:flutter/material.dart';
import 'package:template/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    cardColor: AppColors.card,
    dividerColor: AppColors.divider,
    shadowColor: AppColors.boxShadow,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onSurface: AppColors.textPrimary,
      surface: AppColors.card,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF1E2430),
    cardColor: const Color(0xFF293142),
    dividerColor: const Color(0xFF3B455A),
    shadowColor: Colors.black26,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF7BA7FF),
      onSurface: Color(0xFFE8ECF7),
      surface: Color(0xFF293142),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
