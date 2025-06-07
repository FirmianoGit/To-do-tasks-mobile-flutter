import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrderMenuButton extends StatelessWidget {
  final void Function(String) onSelected;

  const OrderMenuButton({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.sort), // Ícone do botão
      onSelected: onSelected,
      color: AppColors.white,
      borderRadius: BorderRadius.circular(15),
      position: PopupMenuPosition.under,
      itemBuilder: (BuildContext context) => [
         PopupMenuItem<String>(
          value: 'recentes',
          child: Text('Mais recentes', style: AppTextStyles.midText.copyWith(fontSize: 15),),
        ),
        PopupMenuItem<String>(
          value: 'antigas',
          child: Text('Mais antigas', style: AppTextStyles.midText.copyWith(fontSize: 15)),
        ),
        PopupMenuItem<String>(
          value: 'Prioridade alta',
          child: Text('Prioridade Alta', style: AppTextStyles.midText.copyWith(fontSize: 15)),
        ),
        PopupMenuItem<String>(
          value: 'Prioridade média',
          child: Text('Prioridade média', style: AppTextStyles.midText.copyWith(fontSize: 15)),
        ),
        PopupMenuItem<String>(
          value: 'Prioridade baixa',
          child: Text('Prioridade baixa', style: AppTextStyles.midText.copyWith(fontSize: 15)),
        ),
      ],
    );
  }
}
