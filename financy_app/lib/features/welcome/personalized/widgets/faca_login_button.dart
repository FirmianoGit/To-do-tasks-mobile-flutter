import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:financy_app/commom/constants/app_text_styles.dart';
import 'package:financy_app/features/Login/login_page.dart';
import 'package:financy_app/commom/constants/app_custom_route_animation.dart';
import 'package:flutter/material.dart';

class FacaLoginButton extends StatelessWidget {
  const FacaLoginButton({
    super.key,
    required String child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
            // Navegar para a próxima página
            Navigator.push(
              context,
              createCustomRoute(page: const LoginPage(), duration: const Duration(milliseconds: 500)),
            );
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.only(left: 3)),
        splashFactory: NoSplash
            .splashFactory, // Remove o efeito de splash
        overlayColor:
            WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            return Colors
                .transparent; // Remove a cor de overlay ao pressionar
          },
        ),
      ),
      child: Text(
        'Faça Login',
        style: AppTextStyles.thinText
            .copyWith(color: AppColors.greenLightOne),
      ),
    );
  }
}
