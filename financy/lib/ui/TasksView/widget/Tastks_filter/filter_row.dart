
import 'package:financy_app/ui/TasksView/widget/Tastks_filter/selectable_task_button.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Widget melhorado para exibir uma linha de filtros de tarefas
/// Agora a linha é arrastável horizontalmente caso não caibam todos os botões
/// e os textos dos botões não são cortados
/// Adiciona efeito de fade nas laterais igual à tasklist
///
/// MANUTENÇÃO:
/// - Para adicionar novos filtros, basta incluir novos objetos FilterOption na lista [filters].
/// - O callback [onFilterChanged] é chamado sempre que um filtro é selecionado/deselecionado.
/// - O layout é responsivo e permite rolagem horizontal caso haja muitos filtros.
/// - O efeito de fade nas laterais é feito via ShaderMask.
/// - O espaçamento entre os botões é controlado para não haver espaço extra antes do primeiro ou após o último.
/// - O botão de filtro é implementado em SelectableTaskButton.
/// - Se precisar alterar o visual dos botões, edite o SelectableTaskButton.
/// - Para alterar o texto do título, modifique o Text 'Filtrar por:'.
/// - Para alterar o tamanho mínimo/máximo dos botões, ajuste os BoxConstraints em _buildScrollableFilterButtons.
/// - Para alterar o fade, modifique o LinearGradient em ShaderMask.
/// - Para internacionalização, troque os textos fixos por variáveis ou use o pacote de i18n.
/// - Para tornar os filtros controlados externamente, converta FiltersRow para StatefulWidget e gerencie o estado dos filtros externamente.
class FiltersRow extends StatelessWidget {
  /// Lista de filtros disponíveis
  final List<FilterOption> filters;

  /// Callback chamado quando um filtro é selecionado
  final void Function(String filterKey, bool isSelected)? onFilterChanged;

  const FiltersRow({
    super.key,
    required this.filters,
    this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título da seção
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              'Filtrar por:',
              style: AppTextStyles.thinText.copyWith(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Row arrastável horizontalmente, com fade nas laterais
          SizedBox(
            height: 52,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                // O gradiente cria o efeito de fade nas laterais
                return const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.transparent, // fade na esquerda
                    Colors.black,       // conteúdo visível
                    Colors.black,       // conteúdo visível
                    Colors.transparent, // fade na direita
                  ],
                  stops: [0.0, 0.02, 0.98, 1.0],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildScrollableFilterButtons(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Constrói a lista de botões de filtro para a Row arrastável
  /// Corrige o padding para que o espaçamento entre todos os botões seja igual,
  /// sem espaçamento extra antes do primeiro botão e sem espaçamento extra após o último.
  ///
  /// MANUTENÇÃO:
  /// - Para alterar o espaçamento entre os botões, modifique o valor de left em EdgeInsets.only.
  /// - Para alterar o tamanho mínimo/máximo dos botões, ajuste os BoxConstraints.
  /// - O botão é centralizado verticalmente via Center.
  List<Widget> _buildScrollableFilterButtons(BuildContext context) {
    List<Widget> buttons = [];
    for (int i = 0; i < filters.length; i++) {
      buttons.add(
        Padding(
          padding: EdgeInsets.only(
            left: i == 0 ? 0.0 : 12.0,
            right: 0.0,
          ),
          child: IntrinsicWidth(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 110,
                minHeight: 44,
                maxHeight: 52,
              ),
              child: Center(
                child: SelectableTaskButton(
                  label: filters[i].label,
                  initiallySelected: filters[i].initiallySelected,
                  onSelected: (isSelected) {
                    // Chama o callback externo, se fornecido
                    if (onFilterChanged != null) {
                      onFilterChanged!(filters[i].key, isSelected);
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      );
    }
    return buttons;
  }
}

/// Classe para representar uma opção de filtro
///
/// MANUTENÇÃO:
/// - Para adicionar novos filtros, crie novas instâncias de FilterOption.
/// - O campo [key] deve ser único para cada filtro.
/// - O campo [label] é o texto exibido no botão.
/// - O campo [initiallySelected] define se o filtro começa selecionado.
class FilterOption {
  final String key;
  final String label;
  final bool initiallySelected;

  const FilterOption({
    required this.key,
    required this.label,
    this.initiallySelected = false,
  });
}

/// Widget de conveniência que mantém a interface original
/// mas com melhor responsividade
///
/// MANUTENÇÃO:
/// - Para alterar os filtros padrão, edite a lista [filters].
/// - Para implementar a lógica real de filtro, substitua o print no onFilterChanged.
class ImprovedFiltersRowSimple extends StatelessWidget {
  const ImprovedFiltersRowSimple({super.key});

  @override
  Widget build(BuildContext context) {
    return FiltersRow(
      filters: const [
        FilterOption(
          key: 'todo',
          label: 'A fazer',
          initiallySelected: false,
        ),
        FilterOption(
          key: 'in_progress',
          label: 'Em andamento',
          initiallySelected: false,
        ),
        FilterOption(
          key: 'done',
          label: 'Feito',
          initiallySelected: false,
        ),
      ],
      onFilterChanged: (filterKey, isSelected) {
        // Implementar lógica de filtro aqui
        // Exemplo: atualizar estado, filtrar lista, etc.
        print('Filtro $filterKey: $isSelected');
      },
    );
  }
}
