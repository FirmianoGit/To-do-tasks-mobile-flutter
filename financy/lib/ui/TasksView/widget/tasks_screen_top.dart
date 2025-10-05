import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class TasksScreentop extends StatelessWidget implements PreferredSizeWidget {
  const TasksScreentop({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  // TODO: mudar o nome do usuário para o nome do usuário logado
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey.shade100,
      elevation: 5,
      automaticallyImplyLeading: false,
      title: RichText(
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
      centerTitle: false,
      toolbarHeight: screenHeight * 0.12,
      // Você pode ajustar a altura conforme necessário
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(screenHeight * 0.12);
}