import 'package:financy_app/ui/TasksView/widget/Tastks_filter/selectable_task_button.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class Filtersrow extends StatelessWidget {
  const Filtersrow({
    super.key,
    required this.totalWidth,
    required this.buttonWidth,
  });

  final double totalWidth;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: SizedBox(
          width: totalWidth,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Filtrar por:',
                    style: AppTextStyles.thinText.copyWith(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: buttonWidth,
                    child: SelectableTaskButton(
                      label: 'A fazer',
                      onSelected: (index) {
                        // lógica
                      },
                    ),
                  ),
                  SizedBox(
                    width: buttonWidth,
                    child: SelectableTaskButton(
                      label: 'Em andamento',
                      onSelected: (index) {
                        // lógica
                      },
                    ),
                  ),
                  SizedBox(
                    width: buttonWidth,
                    child: SelectableTaskButton(
                      label: 'Feito',
                      onSelected: (index) {
                        // lógica
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
