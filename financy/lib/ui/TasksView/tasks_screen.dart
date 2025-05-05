import 'package:financy_app/ui/TasksView/widget/Tastks_filter/filter_row.dart';
import 'package:financy_app/ui/TasksView/widget/Tastks_filter/selectable_task_button.dart';
import 'package:financy_app/ui/TasksView/widget/tasks_completed_widget.dart';
import 'package:financy_app/ui/TasksView/widget/tasks_screen_top.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Fazer toda a página Reativa e com estado
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final totalWidth = screenWidth * 0.9;
    final spacing = 12.0; // espaçamento entre os botões
    final buttonWidth = (totalWidth - 2 * spacing) / 3;

    return Scaffold(
      body: Column(
        children: [
          TasksScreentop(screenHeight: screenHeight),
          TasksCompletedWidget(screenHeight: screenHeight, screenWidth: screenWidth),
          Filtersrow(totalWidth: totalWidth, buttonWidth: buttonWidth)
        ],
      ),
      backgroundColor: AppColors.white,
    );
  }
}





