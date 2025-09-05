import 'package:flutter/material.dart';
import 'package:financy_app/domain/models/tasks/tasks.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';

/// Widget que representa um card de tarefa individual na lista.
/// Exibe informações como prioridade, título, data de criação e status de conclusão.
/// 
/// Manutenção:
/// - Para alterar o layout do card, edite o método build.
/// - Para mudar a lógica de exibição de prioridade, altere os getters: prioridadeTexto, corPrioridade, iconePrioridade.
/// - Para modificar o formato da data, altere o método _formatarData.
/// - Para limitar o tamanho do título, ajuste o método _tituloLimitado.
class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback? onTap;
  final bool? isCompleted; // Opcional: indica se a tarefa está concluída

  const TaskCard({
    super.key,
    required this.task,
    this.onTap,
    this.isCompleted,
  });

  /// Retorna o texto correspondente à prioridade da tarefa.
  String get prioridadeTexto {
    switch (task.prioridade) {
      case 1:
        return 'ALTA';
      case 2:
        return 'MÉDIA';
      case 3:
        return 'BAIXA';
      default:
        return 'DESCONHECIDA';
    }
  }

  /// Retorna a cor associada à prioridade da tarefa.
  Color get corPrioridade {
    switch (task.prioridade) {
      case 1:
        return const Color(0xFFE53E3E); // Vermelho para alta prioridade
      case 2:
        return const Color(0xFFFF8C00); // Laranja para média prioridade
      case 3:
        return const Color(0xFF38A169); // Verde para baixa prioridade
      default:
        return const Color(0xFF718096); // Cinza para desconhecida
    }
  }

  /// Retorna o ícone visual que representa a prioridade.
  IconData get iconePrioridade {
    switch (task.prioridade) {
      case 1:
        return Icons.keyboard_arrow_up; // Seta para cima (alta)
      case 2:
        return Icons.remove; // Traço (média)
      case 3:
        return Icons.keyboard_arrow_down; // Seta para baixo (baixa)
      default:
        return Icons.help_outline; // Interrogação (desconhecida)
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Tamanhos de fonte ajustados conforme o tamanho da tela
    final tituloFontSize = screenWidth * 0.048; // Título maior
    final dataFontSize = screenWidth * 0.035; // Data menor
    final prioridadeFontSize = screenWidth * 0.038; // Prioridade intermediária

    return Container(
      margin: const EdgeInsets.only(bottom: 8), // Espaçamento entre cards
      child: Material(
        color: Colors.white, // Cor de fundo do card
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap, // Callback ao clicar no card
          borderRadius: BorderRadius.circular(12),
          splashColor: corPrioridade.withValues(alpha: 0.1), // Cor do splash ao clicar
          highlightColor: corPrioridade.withValues(alpha: 0.5), // Cor do highlight ao pressionar
          child: Container(
            width: double.infinity,
            // Decoração do card: borda, sombra, etc.
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: corPrioridade.withValues(alpha: 0.1),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha:0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Linha superior: badge de prioridade e status de conclusão
                Row(
                  children: [
                    // Badge de prioridade
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: corPrioridade.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: corPrioridade.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            iconePrioridade,
                            size: 16,
                            color: corPrioridade,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            prioridadeTexto,
                            style: AppTextStyles.midText.copyWith(
                              fontSize: prioridadeFontSize,
                              color: corPrioridade,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    // Ícone de status de conclusão (se fornecido)
                    if (isCompleted != null)
                      Icon(
                        isCompleted! 
                          ? Icons.check_circle 
                          : Icons.radio_button_unchecked,
                        color: isCompleted! 
                          ? const Color(0xFF38A169) 
                          : const Color(0xFF718096),
                        size: 20,
                      ),
                  ],
                ),
                
                const SizedBox(height: 12),
                
                // Título da tarefa (limitado em tamanho e linhas)
                Text(
                  _tituloLimitado(task.titulo),
                  style: AppTextStyles.midText.copyWith(
                    fontSize: tituloFontSize,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2D3748),
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                
                const SizedBox(height: 8),
                
                // Linha inferior: data de criação da tarefa
                Row(
                  children: [
                    Icon(
                      Icons.schedule,
                      size: 14,
                      color: const Color(0xFF718096),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _formatarData(task.criadoEm),
                      style: AppTextStyles.thinText.copyWith(
                        fontSize: dataFontSize,
                        color: const Color(0xFF718096),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Formata a data de criação da tarefa para exibição amigável.
  /// Exemplo: "Hoje", "Ontem", "3 dias atrás" ou "dd/MM/yyyy"
  String _formatarData(DateTime data) {
    final agora = DateTime.now();
    final diferenca = agora.difference(data);
    
    if (diferenca.inDays == 0) {
      return 'Hoje';
    } else if (diferenca.inDays == 1) {
      return 'Ontem';
    } else if (diferenca.inDays < 7) {
      return '${diferenca.inDays} dias atrás';
    } else {
      return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}';
    }
  }

  /// Limita o tamanho do título da tarefa para evitar overflow visual.
  /// Se o título for maior que [limite], adiciona reticências.
  String _tituloLimitado(String titulo, {int limite = 60}) {
    return titulo.length > limite ? '${titulo.substring(0, limite)}...' : titulo;
  }
}
