import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class TasksScreentop extends StatelessWidget {
  const TasksScreentop({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Align(
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
          padding: EdgeInsets.only(left: screenHeight * 0.045),
          child: Text('João Vitor',
          style: AppTextStyles.bigText.copyWith(color: AppColors.greenLightTwo, fontSize: 30)),
        )
      ]),
    );
  }
}