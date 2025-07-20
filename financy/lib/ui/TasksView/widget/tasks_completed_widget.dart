import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Widget que exibe um card com informações sobre tarefas completadas
/// Este widget mostra um título e uma barra de progresso indicando o percentual
/// de tarefas concluídas em relação ao total
class TasksCompletedWidget extends StatelessWidget {
  const TasksCompletedWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  /// Altura da tela para cálculos de dimensão responsiva
  final double screenHeight;
  
  /// Largura da tela para cálculos de dimensão responsiva
  final double screenWidth;

//TODO: fazer a barra de progresso ser dinâmica, de acordo com o número de tarefas concluídas e o número de tarefas totais
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        // Define altura como 10% da altura da tela
        height: screenHeight * 0.1,
        // Define largura como 90% da largura da tela
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.greenLightTwo,
            boxShadow: [
              BoxShadow(
                color: AppColors.green.withOpacity(0.2), // Cor da sombra
                spreadRadius: 5, // Expansão
                blurRadius: 8, // Desfoque
                offset: const Offset(0, 5), // Posição da sombra (x, y)
              ),
            ]),
        child: Column(
          children: [
            // Título "Tarefas completas"
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tarefas completas',
                  style: AppTextStyles.midText
                      .copyWith(fontSize: 28, color: AppColors.white),
                ),
              ),
            ),
            // Barra de progresso indicando percentual de conclusão
             Padding(
              padding:  EdgeInsets.only(left: 15, right: 15, top: 5),
              child:  LinearProgressIndicator(
                backgroundColor: AppColors.white,
                color: AppColors.green,
                value: 0.7, // Valor fixo de 70% de conclusão
                minHeight: 8,
                borderRadius: BorderRadius.circular(10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
