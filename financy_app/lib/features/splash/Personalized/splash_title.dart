// ignore_for_file: file_names

import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:financy_app/commom/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class SplashTitle extends StatelessWidget {
  const SplashTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(
        'Checkpoint',
        style: AppTextStyles.bigText.copyWith(color: AppColors.white),
    );
  }
}
