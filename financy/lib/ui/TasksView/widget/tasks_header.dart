import 'package:financy_app/ui/TasksView/widget/order_menu_button.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class TasksHeader extends StatelessWidget {
  const TasksHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Filtros de Visualização',
              style: AppTextStyles.midText.copyWith(
                color: Colors.black,
                fontSize: screenHeight * 0.025,
                fontWeight: AppTextStyles.midText.copyWith(fontWeight: FontWeight.w400).fontWeight,
              ),
            ),
            OrderMenuButton(
              onFiltersChanged: (value) {
                // TODO: lógica de ordenação
              },
            ),
          ],
        ),
      ],
    );
  }
}