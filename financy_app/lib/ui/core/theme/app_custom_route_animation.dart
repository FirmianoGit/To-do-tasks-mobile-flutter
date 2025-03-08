import 'package:flutter/material.dart';

Route createCustomRoute({
  required Widget page, // Página de destino
  Duration duration = const Duration(milliseconds: 800), // Duração padrão
  Curve curve = Curves.easeInOut, // Curva padrão
}) {
  return PageRouteBuilder(
    transitionDuration: duration,
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
        child: child,
      );
    },
  );
}