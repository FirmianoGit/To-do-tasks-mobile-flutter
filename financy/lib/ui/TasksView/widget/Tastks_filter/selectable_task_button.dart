import 'package:flutter/material.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';

class SelectableTaskButton extends StatefulWidget {
  final String label;
  final bool initiallySelected;
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
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.initiallySelected;
  }

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
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isSelected ? AppColors.green : Colors.grey,
          boxShadow: [
            BoxShadow(
              color: AppColors.green.withAlpha(25), // ~10% de opacidade
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
            fontSize: 13,
            
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
