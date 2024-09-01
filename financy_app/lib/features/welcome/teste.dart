import 'dart:math';

import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  final Color corSuperior;
  final Color corInferior;
  final double angle; // Ângulo em graus
  final double splitRatio; // Proporção da cor superior

  BackgroundPainter({
    required this.corSuperior,
    required this.corInferior,
    required this.angle,
    required this.splitRatio,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();

    // Converter ângulo para radianos
    final double rad = angle * pi / 180;

    // Determinar a altura da cor superior com base na proporção
    final double y = size.height * splitRatio;

    // Calcular a posição x onde a linha corta a largura com base no ângulo e na altura
    final double x = y / tan(rad);

    Path pathSuperior = Path();
    pathSuperior.moveTo(0, 0);
    pathSuperior.lineTo(x, y);
    pathSuperior.lineTo(size.width, size.height);
    pathSuperior.lineTo(size.width, 0);
    pathSuperior.close();

    paint.color = corSuperior;
    canvas.drawPath(pathSuperior, paint);

    Path pathInferior = Path();
    pathInferior.moveTo(0, y);
    pathInferior.lineTo(x, y);
    pathInferior.lineTo(0, size.height);
    pathInferior.close();

    paint.color = corInferior;
    canvas.drawPath(pathInferior, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}