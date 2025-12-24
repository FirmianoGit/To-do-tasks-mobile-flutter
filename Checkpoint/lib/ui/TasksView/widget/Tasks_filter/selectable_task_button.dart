import 'package:financy_app/ui/core/theme/responsive_font.dart';
import 'package:flutter/material.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';

/// Widget melhorado que representa um botão selecionável para filtrar tarefas
/// Versão aprimorada com melhor UX, responsividade e acessibilidade
/// 
/// Manutenção:
/// - O botão pode ser usado em listas de filtros, como na tela de tarefas.
/// - O estado de seleção é interno, mas pode ser inicializado e notificado externamente.
/// - O callback [onSelected] é chamado sempre que o estado de seleção muda.
/// - O visual do botão muda conforme selecionado ou não.
/// - O texto é truncado com reticências se não couber.
/// - O botão é responsivo ao tamanho da fonte.
class SelectableTaskButton extends StatefulWidget {
  /// Texto que será exibido no botão
  final String label;
  
  /// Define se o botão começa selecionado ou não
  final bool initiallySelected;
  
  /// Callback que é chamado quando o estado de seleção do botão muda
  final void Function(bool isSelected)? onSelected;

  const SelectableTaskButton({
    super.key,
    required this.label,
    this.initiallySelected = false,
    this.onSelected,
  });

  @override
  State<SelectableTaskButton> createState() => _SelectableTaskButton();
}

class _SelectableTaskButton extends State<SelectableTaskButton> {
  /// Estado que controla se o botão está selecionado ou não
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    // Inicializa o estado de seleção com o valor passado no construtor
    isSelected = widget.initiallySelected;
  }

  /// Alterna o estado de seleção do botão e chama o callback, se existir.
  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
    if (widget.onSelected != null) {
      widget.onSelected!(isSelected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        // Ao tocar, alterna o estado de seleção
        onTap: toggleSelection,
        borderRadius: BorderRadius.circular(12),
        splashColor: isSelected 
          ? AppColors.green.withValues(alpha:0.2) 
          : Colors.grey.withValues(alpha:0.2),
        highlightColor: isSelected 
          ? AppColors.green.withValues(alpha:0.1) 
          : Colors.grey.withValues(alpha:0.1),
        child: AnimatedContainer(
          // Duração da animação de transição entre estados
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            // Cor de fundo muda conforme selecionado
            color: isSelected 
              ? AppColors.green 
              : Colors.grey.shade200,
            border: Border.all(
              color: isSelected 
                ? AppColors.green 
                : Colors.grey.shade300,
              width: 1.5,
            ),
            // Sombra mais forte quando selecionado
            boxShadow: isSelected ? [
              BoxShadow(
                color: AppColors.green.withValues(alpha:0.3),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ] : [
              BoxShadow(
                color: Colors.black.withValues(alpha:0.05),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Exibe ícone de check apenas se estiver selecionado
              if (isSelected) ...[
                Icon(
                  Icons.check_circle_rounded,
                  size: responsiveFont(context, 16),
                  color: Colors.white,
                ),
                const SizedBox(width: 6),
              ],
              
              // Texto do botão, truncado se necessário
              Flexible(
                child: Text(
                  widget.label,
                  style: AppTextStyles.midText.copyWith(
                    color: isSelected 
                      ? Colors.white 
                      : Colors.grey.shade800,
                    fontSize: responsiveFont(context, 14),
                    fontWeight: isSelected 
                      ? FontWeight.w600 
                      : FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
