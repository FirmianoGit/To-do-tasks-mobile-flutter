import 'package:flutter/material.dart';
import 'package:financy_app/domain/models/tasks/tasks.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback? onTap;

  const TaskCard({
    super.key,
    required this.task,
    this.onTap,
  });

  String get prioridadeTexto {
    switch (task.prioridade) {
      case 1:
        return 'Alta';
      case 2:
        return 'Média';
      case 3:
        return 'Baixa';
      default:
        return 'Desconhecida';
    }
  }

  Color get corPrioridade {
    switch (task.prioridade) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Fontes ajustadas proporcionalmente à largura da tela
    final tituloFontSize = screenWidth * 0.045; // ~18 em 400px
    final dataFontSize = screenWidth * 0.04;
    final prioridadeLabelFontSize = screenWidth * 0.04;
    final prioridadeValorFontSize = screenWidth * 0.045;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Coluna da esquerda: título e data
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _tituloLimitado(task.titulo),
                    style: AppTextStyles.midText.copyWith(
                      fontSize: tituloFontSize,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatarData(task.criadoEm),
                    style: AppTextStyles.thinText.copyWith(
                      color: Colors.black,
                      fontSize: dataFontSize,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            /// Coluna da direita: prioridade
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Prioridade:',
                  style: AppTextStyles.midText.copyWith(
                    fontSize: prioridadeLabelFontSize,
                  ),
                ),
                Text(
                  prioridadeTexto,
                  style: AppTextStyles.bigText.copyWith(
                    fontSize: prioridadeValorFontSize,
                    color: corPrioridade,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatarData(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}';
  }

  String _tituloLimitado(String titulo, {int limite = 35}) {
    return titulo.length > limite ? '${titulo.substring(0, limite)}...' : titulo;
  }
}
