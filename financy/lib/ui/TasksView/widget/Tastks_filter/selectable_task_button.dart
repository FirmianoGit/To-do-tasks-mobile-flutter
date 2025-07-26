import 'package:financy_app/ui/core/theme/responsive_font.dart';
import 'package:flutter/material.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';

/// Widget que representa um botão selecionável para filtrar tarefas
/// Este widget é usado na tela de tarefas para permitir a seleção de filtros
/// como "Todas", "Pendentes", "Concluídas", etc.
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
  State<SelectableTaskButton> createState() => _SelectableTaskButtonState();
}

class _SelectableTaskButtonState extends State<SelectableTaskButton> {
  /// Estado que controla se o botão está selecionado ou não
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    // Inicializa o estado de seleção com o valor passado no construtor
    isSelected = widget.initiallySelected;
  }

  /// Método que alterna o estado de seleção do botão
  /// Quando chamado, inverte o estado atual e notifica o callback se existir
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
    return GestureDetector(
      onTap: toggleSelection,
      child: AnimatedContainer(
        // Duração da animação de transição entre estados
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          // Muda a cor baseado no estado de seleção
          color: isSelected ? AppColors.green : Colors.grey,
          boxShadow: [
            BoxShadow(
              // Sombra com opacidade reduzida (~10%)
              color: isSelected ? AppColors.green.withAlpha(25) : Colors.grey.withAlpha(25),
              spreadRadius: 5,
              blurRadius: 8,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Text(
          widget.label,
          style: AppTextStyles.midText.copyWith(
            color: AppColors.white,
            fontSize: responsiveFont(context, 13),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
