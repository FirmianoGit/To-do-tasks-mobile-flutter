import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

InputDecoration taskInputDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    hintStyle: AppTextStyles.midText.copyWith(
      color: AppColors.greenLightTwo,
      fontSize: 14,
    ),
    filled: true,
    fillColor: AppColors.white,
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppColors.greenLightTwo,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppColors.green,
        width: 1.2,
      ),
    ),
  );
}
