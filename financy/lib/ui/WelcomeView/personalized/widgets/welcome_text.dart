import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'CheckPoint',
        style: AppTextStyles.midText
            .copyWith(color: AppColors.greenLightOne, fontSize: 40),
      ),
      Text(
        'Nunca se perca',
        style: AppTextStyles.midText.copyWith(
            color: AppColors.greenLightOne, fontWeight: FontWeight.w600),
      ),
    ]);
  }
}
