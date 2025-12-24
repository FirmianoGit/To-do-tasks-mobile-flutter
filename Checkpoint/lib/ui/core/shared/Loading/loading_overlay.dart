import 'dart:ui';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class LoadingOverlay extends StatelessWidget {
  final bool isLoading;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        if (isLoading) ...[
          const ModalBarrier(
            dismissible: false,
            color: Colors.white38,
          ),
          Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Center(
                child: LoadingAnimationWidget.horizontalRotatingDots(
                  color: AppColors.green,
                  size: screenWidth * 0.10,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
