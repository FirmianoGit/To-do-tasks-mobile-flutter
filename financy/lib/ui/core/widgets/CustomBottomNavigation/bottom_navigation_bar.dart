import 'package:flutter/material.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';

// CustomNavBar é um widget de barra de navegação inferior personalizada.
// Ele exibe ícones com destaque animado para o item selecionado.
class CustomNavBar extends StatelessWidget {
  // Índice do item atualmente selecionado
  final int selectedIndex;

  // Função de callback chamada quando um item é tocado
  final void Function(int) onItemTapped;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  // Lista de ícones que serão exibidos na barra
  final List<IconData> icons = const [
    Icons.view_agenda_outlined,
    Icons.equalizer_outlined,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70, // Altura da barra inferior // Cor de fundo da barra
      padding:
          const EdgeInsets.symmetric(horizontal: 70), // Espaçamento lateral
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1), // Cor da sombra
          spreadRadius: 5, // Expansão
          blurRadius: 8, // Desfoque
          offset: const Offset(0, 5), // Posição da sombra (x, y)
        ),
      ]),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Distribui os ícones igualmente
        children: List.generate(icons.length, (index) {
          // Verifica se o item atual está selecionado
          final bool isSelected = index == selectedIndex;

          return GestureDetector(
            // Chama o callback com o índice quando o item é tocado
            onTap: () => onItemTapped(index),
            child: Stack(
              alignment:
                  Alignment.center, // Alinha elementos sobrepostos ao centro
              children: [
                // Círculo de fundo que aparece somente quando o item está selecionado
                AnimatedOpacity(
                  opacity: isSelected
                      ? 1.0
                      : 0.0, // Mostra ou oculta com transição suave
                  duration:
                      const Duration(milliseconds: 350), // Duração da animação
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: AppColors.greenWhite, // Cor de fundo do círculo
                      shape: BoxShape.circle, // Formato circular
                    ),
                  ),
                ),
                // Ícone do item de navegação
                Icon(
                  icons[index],
                  color: isSelected
                      ? AppColors.greenLightOne // Cor quando selecionado
                      : Colors.grey, // Cor quando não selecionado
                  size: 28, // Tamanho do ícone
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
