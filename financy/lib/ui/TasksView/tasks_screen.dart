import 'package:financy_app/ui/TasksView/widget/Tastks_filter/filter_row.dart';
import 'package:financy_app/ui/TasksView/widget/task_list/task_list.dart';
import 'package:financy_app/ui/TasksView/widget/tasks_completed_widget.dart';
import 'package:financy_app/ui/TasksView/widget/tasks_header.dart';
import 'package:financy_app/ui/TasksView/widget/tasks_screen_top.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Tela principal de tarefas
///
/// MANUTENÇÃO:
/// - Para alterar o layout geral, edite a estrutura do Column dentro do body.
/// - Para adicionar/remover widgets do topo, edite a lista de children do Column.
/// - Para alterar o espaçamento lateral, modifique o padding do Padding principal.
/// - Para alterar a cor de fundo, edite backgroundColor do Scaffold.
/// - Para modificar os filtros exibidos, altere a lista de FilterOption passada para FiltersRow.
/// - Para implementar a lógica real de filtro, edite o callback onFilterChanged do FiltersRow.
/// - Para alterar o cabeçalho das tarefas, edite o widget TasksHeader.
/// - Para modificar a lista de tarefas, edite o TaskListView.
/// - Para tornar a tela responsiva a diferentes tamanhos, utilize screenWidth e screenHeight conforme necessário.
/// - Para alterar o widget de progresso de tarefas, edite o TasksCompletedWidget.
class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtém dimensões da tela para responsividade
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // Topo da tela com saudação ou informações do usuário
            TasksScreentop(screenHeight: screenHeight),
            // Widget de progresso de tarefas completas
            // TasksCompletedWidget(
            //   screenHeight: screenHeight,
            //   screenWidth: screenWidth,
            // ),
            // Linha de filtros de tarefas
            FiltersRow(
              filters: [
                FilterOption(key: 'all', label: 'Todas'),
                FilterOption(key: 'pending', label: 'Pendentes'),
                FilterOption(key: 'completed', label: 'Concluídas')
              ],
              onFilterChanged: (filterKey, isSelected) {
                // TODO: Implementar lógica de filtro real aqui
              },
            ),
            // Cabeçalho da lista de tarefas (ex: colunas, títulos)
            TasksHeader(),
            // Lista de tarefas expandida para ocupar o espaço restante
            Expanded(
              child: TaskListView(),
            ),
          ],
        ),
      ),
    );
  }
}
