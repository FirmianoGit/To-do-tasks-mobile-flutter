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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Minhas Tarefas:',
              style: AppTextStyles.midText.copyWith(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            OrderMenuButton(
              onSelected: (value) {
                // TODO: lógica de ordenação
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.green,
            shape: CircleBorder(),
            child: const Icon(
              Icons.add,
              color: AppColors.white,
              size: 35,
            ),
          ),
        )
      ],
    );
  }
}