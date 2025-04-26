import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/teste/teste.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({required this.navigationContainer});

  final StatefulNavigationShell navigationContainer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationContainer,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationContainer.currentIndex,
        onDestinationSelected: (index) {
          navigationContainer.goBranch(index,
              initialLocation: true);
        },
        indicatorColor: AppColors.greenWhite,
        destinations: destinations
            .map((destination) => NavigationDestination(
                  icon: Icon(destination.icon),
                  label: '',
                  selectedIcon: Icon(
                    destination.icon,
                    color: Colors.red,
                  ),
                ))
            .toList(),
      ),
    );
  }
}