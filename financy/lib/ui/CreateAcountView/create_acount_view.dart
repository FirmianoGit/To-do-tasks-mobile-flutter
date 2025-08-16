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
      body: Container(
        child: Column(
          children: [
            Text('Create Acount'),
          ],
        ),
      ),
    );
  }
}

