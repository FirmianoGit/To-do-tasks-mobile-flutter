import 'dart:ui';

import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color green = Color(0xFF00B495);
  static const Color greenLightOne = Color(0xFF63B5AF);
  static const Color greenLightTwo = Color(0xFF438883);
  static const Color greenWhite = Color(0xFFEEF8F7);
  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Color(0xFFFF5F57);
  static const Color yellow = Color(0xFFFEBC2F);
  static const List<Color> greenwGradient = [
    Color(0xFF63B5AF),
    Color(0xFF438883)
  ];
}

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.green,
            primary: AppColors.green,
          ),
          datePickerTheme: DatePickerThemeData(
            backgroundColor: AppColors.white,
            headerBackgroundColor: AppColors.green,
            headerForegroundColor: Colors.white,
            dayStyle: AppTextStyles.midText.copyWith(fontWeight: FontWeight.w400, fontSize: 16),
            todayBackgroundColor: WidgetStateProperty.all(
              AppColors.green.withValues(alpha: 0.2),
            ),
            todayForegroundColor: WidgetStateProperty.all(
              AppColors.green,
            ),
            dayForegroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return Colors.white;
              }
              return Colors.black;
            }),
            yearForegroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return Colors.white;
              }
              return Colors.black;
            }),
          ),
        );
  }
}