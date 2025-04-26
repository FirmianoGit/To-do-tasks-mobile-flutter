import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.05, left: screenHeight * 0.01),
              child: Text(
                'Boa tarde',
                style: AppTextStyles.thinText.copyWith(
                  fontSize: 25,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenHeight * 0.05),
              child: Text('Joao Vitor',
              style: AppTextStyles.bigText.copyWith(color: AppColors.greenLightTwo, fontSize: 30)),
            )
          ]),
        )
      ],
    );
  }
}
