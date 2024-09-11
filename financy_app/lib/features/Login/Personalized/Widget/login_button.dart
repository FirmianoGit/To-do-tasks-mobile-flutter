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
        padding: const EdgeInsets.all(12),
        surfaceTintColor: AppColors.greenLightTwo,
        backgroundColor: AppColors.greenWhite,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
      ),
      child: Text(
        'Continuar com e-mail',
        style: AppTextStyles.buttonText
            .copyWith(color: AppColors.greenLightTwo, fontSize: 18),
      ),
    );
  }
}
