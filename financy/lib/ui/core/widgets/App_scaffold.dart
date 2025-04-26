import 'package:financy_app/ui/core/widgets/CustomBottomNavigation/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Tela principal que recebe um NavigationShell do GoRouter
// e exibe a CustomNavBar como barra de navegação inferior.
class ScaffoldScreen extends StatelessWidget {
  const ScaffoldScreen({required this.navigationContainer});

  // Shell de navegação com múltiplas branches, fornecido pelo GoRouter
  final StatefulNavigationShell navigationContainer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // O corpo da tela será controlado dinamicamente pelo NavigationShell
      body: navigationContainer,

      // Barra de navegação inferior personalizada
      bottomNavigationBar: CustomNavBar(
        // Índice do item atualmente selecionado
        selectedIndex: navigationContainer.currentIndex,

        // Ao tocar em um item, navega para a branch correspondente
        onItemTapped: (index) {
          navigationContainer.goBranch(index, initialLocation: true);
        },
      ),
    );
  }
}
