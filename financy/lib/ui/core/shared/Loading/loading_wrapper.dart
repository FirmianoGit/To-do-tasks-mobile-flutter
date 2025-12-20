import 'package:financy_app/core/State/app_loading_controller.dart';
import 'package:financy_app/ui/core/shared/Loading/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppLoadingWrapper extends StatelessWidget {
  final Widget child;

  const AppLoadingWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<AppLoadingController>().isLoading;

    return Stack(
      children: [
        child,
        if (loading) const LoadingOverlay(isLoading: true),
      ],
    );
  }
}
