import 'package:financy_app/ui/TasksView/widget/Tastks_filter/filter_row.dart';
import 'package:financy_app/ui/TasksView/widget/task_list/task_list.dart';
import 'package:financy_app/ui/TasksView/widget/tasks_completed_widget.dart';
import 'package:financy_app/ui/TasksView/widget/tasks_header.dart';
import 'package:financy_app/ui/TasksView/widget/tasks_screen_top.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final totalWidth = screenWidth * 0.9;
    const spacing = 12.0;
    final buttonWidth = (totalWidth - 2 * spacing) / 3;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TasksScreentop(screenHeight: screenHeight),
            TasksCompletedWidget(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
            Filtersrow(totalWidth: totalWidth, buttonWidth: buttonWidth),
            TasksHeader(),
            Expanded(
              child: TaskListView(), 
            ),
          ],
        ),
      ),
    );
  }
}

