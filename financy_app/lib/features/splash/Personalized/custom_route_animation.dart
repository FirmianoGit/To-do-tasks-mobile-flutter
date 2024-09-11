import 'package:financy_app/features/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

Route createRoute() {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 800), // Ajuste a duração da transição
    pageBuilder: (context, animation, secondaryAnimation) => const WelcomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curve = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut, // Adiciona uma curva suave
      );

      return FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curve), // Define a opacidade de 0 a 1
        child: child,
      );
    },
  );
}
