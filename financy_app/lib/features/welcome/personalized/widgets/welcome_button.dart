import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:financy_app/commom/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Container clicado!');
      },
      borderRadius: BorderRadius.circular(
          32), // Garante que o efeito de toque siga o contorno
      highlightColor:
          Colors.white.withOpacity(0.2), // Cor de destaque ao pressionar
      splashColor: Colors.white.withOpacity(0.3), // Cor do efeito de splash
      child: Ink(
        decoration: BoxDecoration(
          color: AppColors.greenLightTwo, // Definindo a cor de fundo aqui
          borderRadius: BorderRadius.circular(32),
        ),
        height: 64,
        width: screenWidth * 0.85,
        child: Center(
          child: Text(
            'Vamos Começar',
            style: AppTextStyles.buttonText.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
