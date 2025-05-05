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
    return Scaffold(
      body: Column(
        children: [
          TasksScreentop(screenHeight: screenHeight),
          TasksCompletedWidget(
              screenHeight: screenHeight, screenWidth: screenWidth)
        ],
      ),
      backgroundColor: AppColors.white,
    );
  }
}
