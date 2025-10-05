import 'package:flutter/material.dart';
import 'package:financy_app/domain/models/tasks/tasks.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';

/// Variação 1: Card Minimalista com barra lateral colorida
/// Este widget exibe um card de tarefa com uma barra lateral indicando a prioridade.
/// Permite customização de callback de clique e status de conclusão.
class MinimalistTaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback? onTap;
  final bool? isCompleted;

  const MinimalistTaskCard({
    super.key,
    required this.task,
    this.onTap,
    this.isCompleted,
  });

  /// Retorna o texto correspondente à prioridade da tarefa.
  String get prioridadeTexto {
    switch (task.prioridade) {
      case 1: return 'Alta';
      case 2: return 'Média';
      case 3: return 'Baixa';
      default: return 'N/A';
    }
  }

  /// Retorna a cor correspondente à prioridade da tarefa.
  Color get corPrioridade {
    switch (task.prioridade) {
      case 1: return const Color(0xFFE53E3E);
      case 2: return const Color(0xFFFF8C00);
      case 3: return const Color(0xFF38A169);
      default: return const Color(0xFF718096);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
              // Mantém o card com cantos arredondados e sombra leve
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  // Barra lateral colorida indicando prioridade
                  Container(
                    width: 4,
                    decoration: BoxDecoration(
                      color: corPrioridade,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                  ),
                  
                  // Conteúdo principal do card
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // Título da tarefa
                              Expanded(
                                child: Text(
                                  task.titulo,
                                  style: AppTextStyles.midText.copyWith(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF2D3748),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              // Ícone de status de conclusão, se fornecido
                              if (isCompleted != null)
                                Icon(
                                  isCompleted! 
                                    ? Icons.check_circle_outline 
                                    : Icons.radio_button_unchecked,
                                  color: isCompleted! 
                                    ? const Color(0xFF38A169) 
                                    : const Color(0xFF718096),
                                  size: 20,
                                ),
                            ],
                          ),
                          
                          const SizedBox(height: 8),
                          
                          Row(
                            children: [
                              // Badge de prioridade
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: corPrioridade.withValues(alpha:0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  prioridadeTexto,
                                  style: AppTextStyles.thinText.copyWith(
                                    fontSize: screenWidth * 0.032,
                                    color: corPrioridade,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              
                              const SizedBox(width: 12),
                              
                              // Data de criação formatada
                              Text(
                                _formatarData(task.criadoEm),
                                style: AppTextStyles.thinText.copyWith(
                                  fontSize: screenWidth * 0.032,
                                  color: const Color(0xFF718096),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Formata a data de criação da tarefa para exibição amigável.
  /// Exibe "Hoje", "Ontem", "Xd atrás" ou a data completa.
  String _formatarData(DateTime data) {
    final agora = DateTime.now();
    final diferenca = agora.difference(data);
    
    if (diferenca.inDays == 0) {
      return 'Hoje';
    } else if (diferenca.inDays == 1) {
      return 'Ontem';
    } else if (diferenca.inDays < 7) {
      return '${diferenca.inDays}d atrás';
    } else {
      return '${data.day}/${data.month}/${data.year}';
    }
  }
}

/// Variação 2: Card Compacto com layout horizontal
/// Este widget exibe um card de tarefa em formato compacto, ideal para listas densas.
/// Mostra ícone de prioridade, título, data e status de conclusão.
class CompactTaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback? onTap;
  final bool? isCompleted;

  const CompactTaskCard({
    super.key,
    required this.task,
    this.onTap,
    this.isCompleted,
  });

  /// Retorna a cor correspondente à prioridade da tarefa.
  Color get corPrioridade {
    switch (task.prioridade) {
      case 1: return const Color(0xFFE53E3E);
      case 2: return const Color(0xFFFF8C00);
      case 3: return const Color(0xFF38A169);
      default: return const Color(0xFF718096);
    }
  }

  /// Retorna o ícone correspondente à prioridade da tarefa.
  IconData get iconePrioridade {
    switch (task.prioridade) {
      case 1: return Icons.priority_high;
      case 2: return Icons.remove;
      case 3: return Icons.keyboard_arrow_down;
      default: return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      child: Material(
        color: const Color(0xFFFAFAFA),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xFFE2E8F0),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                // Ícone de prioridade com fundo colorido
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: corPrioridade.withValues(alpha:0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    iconePrioridade,
                    size: 16,
                    color: corPrioridade,
                  ),
                ),
                
                const SizedBox(width: 12),
                
                // Título da tarefa e data de criação
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título limitado para evitar overflow
                      Text(
                        _tituloLimitado(task.titulo, limite: 40),
                        style: AppTextStyles.midText.copyWith(
                          fontSize: screenWidth * 0.042,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF2D3748),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      
                      const SizedBox(height: 2),
                      
                      // Data de criação formatada (dia/mês)
                      Text(
                        _formatarData(task.criadoEm),
                        style: AppTextStyles.thinText.copyWith(
                          fontSize: screenWidth * 0.032,
                          color: const Color(0xFF718096),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Ícone de status de conclusão, se fornecido
                if (isCompleted != null)
                  Icon(
                    isCompleted! 
                      ? Icons.check_circle 
                      : Icons.radio_button_unchecked,
                    color: isCompleted! 
                      ? const Color(0xFF38A169) 
                      : const Color(0xFF718096),
                    size: 22,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Formata a data de criação da tarefa para exibição no formato dia/mês.
  String _formatarData(DateTime data) {
    return '${data.day}/${data.month}';
  }

  /// Limita o título da tarefa ao número de caracteres especificado.
  /// Adiciona "..." caso o texto seja maior que o limite.
  String _tituloLimitado(String titulo, {int limite = 40}) {
    return titulo.length > limite ? '${titulo.substring(0, limite)}...' : titulo;
  }
}
