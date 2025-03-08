// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BottomRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double radius = 50.0;

    // Começa do canto superior esquerdo
    path.lineTo(0, size.height - radius);

    // Desenha curva na parte inferior esquerda
    path.quadraticBezierTo(0, size.height, radius, size.height);

    // Linha reta na parte inferior
    path.lineTo(size.width - radius, size.height);

    // Desenha curva na parte inferior direita
    path.quadraticBezierTo(size.width, size.height, size.width, size.height - radius);

    // Linha reta até o canto superior direito
    path.lineTo(size.width, 0);

    // Linha reta até o ponto inicial
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}