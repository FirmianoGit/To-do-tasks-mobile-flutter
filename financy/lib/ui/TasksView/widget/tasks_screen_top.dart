import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class TasksScreentop extends StatelessWidget {
  const TasksScreentop({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;
//TODO: mudar o nome do usuário para o nome do usuário logado
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.05,
          left: 0,
        ),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Boa tarde ',
                style: AppTextStyles.thinText.copyWith(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: 'João Vitor',
                style: AppTextStyles.bigText.copyWith(
                  color: AppColors.greenLightTwo,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}