// lib/ui/components/shell_nav_bar.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';

class ShellNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ShellNavBar({
    super.key,
    required this.navigationShell,
  });

  List<PersistentRouterTabConfig> _buildTabConfigs() => [
        PersistentRouterTabConfig(
          item: ItemConfig(
            icon: const Icon(Icons.home),
            title: "Home",
            activeForegroundColor: AppColors.green,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentRouterTabConfig(
          item: ItemConfig(
            icon: const Icon(Icons.message),
            title: "Messages",
            activeForegroundColor: AppColors.green,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentRouterTabConfig(
          item: ItemConfig(
            icon: const Icon(Icons.settings),
            title: "Settings",
            activeForegroundColor: AppColors.green,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView.router(
      tabs: _buildTabConfigs(),
      navBarBuilder: (navBarConfig) => Style13BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              spreadRadius: 5,
              blurRadius: 8,
              offset: const Offset(0, 5),
            ),
          ],
        ),
      ),
      navigationShell: navigationShell,
    );
  }
}
