import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:financy_app/commom/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.greenLightTwo,
        padding: const EdgeInsets.all(12),
        backgroundColor: AppColors.white,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
      child: Text(
        'Continuar ',
        style: AppTextStyles.buttonText
            .copyWith(color: AppColors.greenLightTwo, fontSize: 18),
      ),
    );
  }
}
