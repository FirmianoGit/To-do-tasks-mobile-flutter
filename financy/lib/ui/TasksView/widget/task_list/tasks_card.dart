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

  /// Retorna o texto correspondente à prioridade da tarefa
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

  /// Retorna a cor associada à prioridade da tarefa
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
    return GestureDetector(
      onTap: onTap, // Executa ação ao tocar no card (caso fornecida)
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4), // Cor de fundo do card
          borderRadius: BorderRadius.circular(5), // Borda arredondada
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Coluna da esquerda (título e data)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título limitado a um número de caracteres
                    Text(
                      _tituloLimitado(task.titulo),
                      style: AppTextStyles.midText.copyWith(fontSize: 18),
                    ),
                    // Data formatada (ex: 05/05/2025)
                    Text(
                      _formatarData(task.criadoEm),
                      style: AppTextStyles.thinText.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              // Coluna da direita (prioridade)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Text(
                      'Prioridade:',
                      style: AppTextStyles.midText.copyWith(fontSize: 16),
                    ),
                    Text(
                      prioridadeTexto,
                      style: AppTextStyles.bigText.copyWith(
                        fontSize: 16,
                        color: corPrioridade,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Formata a data para o formato dd/MM/yyyy
  String _formatarData(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}';
  }

  /// Limita o título a um número de caracteres e adiciona reticências, se necessário
  String _tituloLimitado(String titulo, {int limite = 25}) {
    return titulo.length > limite ? '${titulo.substring(0, limite)}...' : titulo;
  }
}
