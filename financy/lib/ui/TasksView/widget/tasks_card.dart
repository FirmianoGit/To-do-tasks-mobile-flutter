import 'package:flutter/material.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';

class TaskCard extends StatelessWidget {
  final String titulo;
  final String data;
  final String prioridade;
  final Color corPrioridade;
  final VoidCallback onTap;

  const TaskCard({
    super.key,
    required this.titulo,
    required this.data,
    required this.prioridade,
    required this.corPrioridade,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      style: AppTextStyles.midText.copyWith(fontSize: 18),
                    ),
                    Text(
                      data,
                      style: AppTextStyles.thinText.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  prioridade,
                  style: AppTextStyles.bigText.copyWith(
                    fontSize: 19,
                    color: corPrioridade,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
