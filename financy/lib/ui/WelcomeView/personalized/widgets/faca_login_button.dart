import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FacaLoginButton extends StatelessWidget {
  const FacaLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.push('/login'),
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
