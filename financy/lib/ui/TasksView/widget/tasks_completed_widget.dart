import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class TasksCompletedWidget extends StatelessWidget {
  const TasksCompletedWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: screenHeight * 0.1,
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.greenLightTwo,
            boxShadow: [
              BoxShadow(
                color: AppColors.green.withOpacity(0.2), // Cor da sombra
                spreadRadius: 5, // Expansão
                blurRadius: 8, // Desfoque
                offset: const Offset(0, 5), // Posição da sombra (x, y)
              ),
            ]),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tarefas completas',
                  style: AppTextStyles.midText
                      .copyWith(fontSize: 28, color: AppColors.white),
                ),
              ),
            ),
            const Padding(
              padding:  EdgeInsets.only(left: 15, right: 15, top: 5),
              child:  LinearProgressIndicator(
                backgroundColor: AppColors.white,
                color: AppColors.green,
                value: 0.7,
              ),
            )
          ],
        ),
      ),
    );
  }
}
