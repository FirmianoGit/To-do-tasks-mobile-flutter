import 'package:flutter/material.dart';

class InclinedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height - 50); // Ponto inicial no canto inferior esquerdo
    path.lineTo(size.width, size.height); // Ponto final com inclinação
    path.lineTo(size.width, 0.0); // Canto superior direito
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}