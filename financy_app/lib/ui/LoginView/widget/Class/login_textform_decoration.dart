import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

InputDecoration textFormFildDecoration(String? hint) {
  return InputDecoration(
    hintText: hint,
    hintStyle: AppTextStyles.buttonText
        .copyWith(color: AppColors.greenLightTwo, fontSize: 18), // Label para o campo
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    filled: true,
    fillColor: AppColors.white,
    focusedBorder: OutlineInputBorder(
      // Define a borda quando o campo está focado
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: AppColors.greenLightTwo, // Cor da borda quando focado
        width: 1.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      // Define a borda quando o campo está focado
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(
        color: AppColors.greenLightTwo, // Cor da borda quando focado
        width: 1.0,
      ),
    ),
    // Borda do campo
  );
}
