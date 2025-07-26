import 'package:flutter/material.dart';

/// Retorna um tamanho de fonte proporcional à largura da tela.
/// 
/// [baseSize] é o tamanho de fonte considerado para uma tela "média" (~360px).
double responsiveFont(BuildContext context, double baseSize) {
  final screenWidth = MediaQuery.of(context).size.width;
  // Assume base de 360. Ajusta proporcionalmente.
  return screenWidth * (baseSize / 360);
}
