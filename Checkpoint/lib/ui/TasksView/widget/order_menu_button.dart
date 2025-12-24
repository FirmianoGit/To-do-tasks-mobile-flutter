import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrderMenuButton extends StatefulWidget {
  final void Function(Set<String>) onFiltersChanged;

  const OrderMenuButton({super.key, required this.onFiltersChanged});

  @override
  State<OrderMenuButton> createState() => _OrderMenuButtonState();
}

class _OrderMenuButtonState extends State<OrderMenuButton> {
  // Mantém o estado dos filtros selecionados
  final Set<String> _selectedFilters = {};

  void _toggleFilter(String filter) {
    setState(() {
      if (_selectedFilters.contains(filter)) {
        _selectedFilters.remove(filter);
      } else {
        _selectedFilters.add(filter);
      }
    });
    // Notifica o widget pai sobre as mudanças
    widget.onFiltersChanged(_selectedFilters);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Stack(
        children: [
          const Icon(Icons.filter_alt_outlined),
          // Badge mostrando quantidade de filtros ativos
          if (_selectedFilters.isNotEmpty)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Text(
                  '${_selectedFilters.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
      color: AppColors.white,
      borderRadius: BorderRadius.circular(15),
      position: PopupMenuPosition.under,
      itemBuilder: (BuildContext context) => [
        // Seção de ordenação
        PopupMenuItem<String>(
          enabled: false,
          child: Text(
            'ORDENAÇÃO',
            style: AppTextStyles.midText.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        _buildCheckboxMenuItem('recentes', 'Mais recentes'),
        _buildCheckboxMenuItem('antigas', 'Mais antigas'),
        
        const PopupMenuDivider(),
        
        // Seção de prioridade
        PopupMenuItem<String>(
          enabled: false,
          child: Text(
            'PRIORIDADE',
            style: AppTextStyles.midText.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        _buildCheckboxMenuItem('alta', 'Prioridade Alta'),
        _buildCheckboxMenuItem('media', 'Prioridade Média'),
        _buildCheckboxMenuItem('baixa', 'Prioridade Baixa'),
        
        // Botão para limpar filtros
        if (_selectedFilters.isNotEmpty) ...[
          const PopupMenuDivider(),
          PopupMenuItem<String>(
            onTap: () {
              setState(() {
                _selectedFilters.clear();
              });
              widget.onFiltersChanged(_selectedFilters);
            },
            child: Row(
              children: [
                const Icon(Icons.clear_all, size: 18),
                const SizedBox(width: 8),
                Text(
                  'Limpar filtros',
                  style: AppTextStyles.midText.copyWith(
                    fontSize: 15,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  PopupMenuItem<String> _buildCheckboxMenuItem(String value, String label) {
    return PopupMenuItem<String>(
      onTap: () => _toggleFilter(value),
      child: Row(
        children: [
          Icon(
            _selectedFilters.contains(value)
                ? Icons.check_box
                : Icons.check_box_outline_blank,
            color: _selectedFilters.contains(value)
                ? AppColors.green
                : Colors.grey,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: AppTextStyles.midText.copyWith(
              fontSize: 15,
              fontWeight: _selectedFilters.contains(value)
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

// EXEMPLO DE USO:
// 
// class MinhaTelaComFiltros extends StatefulWidget {
//   @override
//   State<MinhaTelaComFiltros> createState() => _MinhaTelaComFiltrosState();
// }
// 
// class _MinhaTelaComFiltrosState extends State<MinhaTelaComFiltros> {
//   Set<String> _filtrosAtivos = {};
// 
//   void _aplicarFiltros(Set<String> filtros) {
//     setState(() {
//       _filtrosAtivos = filtros;
//     });
//     
//     // Aqui você pode aplicar a lógica de filtragem
//     print('Filtros ativos: $_filtrosAtivos');
//     
//     // Exemplo de como filtrar uma lista:
//     // List<Item> itensFiltrados = _filtrarItens(_todosItens, _filtrosAtivos);
//   }
// 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           OrderMenuButton(onFiltersChanged: _aplicarFiltros),
//         ],
//       ),
//       body: Center(
//         child: Text('Filtros ativos: ${_filtrosAtivos.join(", ")}'),
//       ),
//     );
//   }
// }