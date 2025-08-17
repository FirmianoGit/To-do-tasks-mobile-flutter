import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:financy_app/ui/core/theme/responsive_font.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        context.go('/createAcount');
      },
      borderRadius: BorderRadius.circular(10),
      highlightColor: Colors.white.withOpacity(0.2),
      splashColor: Colors.white.withOpacity(0.3),
      child: Ink(
        decoration: BoxDecoration(
          color: AppColors.greenLightTwo,
          borderRadius: BorderRadius.circular(10),
        ),
        height: screenHeight * 0.06, // altura responsiva (ex: 8% da tela)
        width: screenWidth * 0.85,
        child: Center(
          child: Text(
            'Vamos Começar',
            style: AppTextStyles.buttonText.copyWith(
              color: AppColors.white,
              fontSize: responsiveFont(context, 16), // base de 18px
            ),
          ),
        ),
      ),
    );
  }
}
