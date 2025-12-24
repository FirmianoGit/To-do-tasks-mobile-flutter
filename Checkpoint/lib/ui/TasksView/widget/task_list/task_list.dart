import 'package:financy_app/data/repositories/tasks/tasks_repository.dart';
import 'package:financy_app/ui/TasksView/widget/task_list/task_card_variations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Widget que exibe a lista de tarefas com suporte a estado reativo
///
/// Este widget usa Provider para escutar mudanças no TaskProvider
/// Sempre que uma tarefa é adicionada, removida ou atualizada,
/// a lista é automaticamente reconstruída
class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    /// Consumer escuta mudanças no TaskProvider e reconstrói quando há atualizações
    /// Se a lista estiver vazia, mostra uma mensagem apropriada
    return Consumer<TasksRepository>(
      builder: (context, taskProvider, child) {
        final tarefas = taskProvider.tasks;

        /// Verifica se há tarefas
        if (tarefas.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.task_alt_outlined,
                  size: 64,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(height: 16),
                Text(
                  'Nenhuma tarefa encontrada',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Crie uma nova tarefa para começar',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        }

        return Stack(
          children: [
            /// ShaderMask aplica um gradiente de transparência em cima e embaixo
            /// Criando um efeito de fade-in e fade-out nas bordas
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent, // topo - fade in
                    Colors.black,       // conteúdo visível
                    Colors.black,       // conteúdo visível
                    Colors.transparent, // fundo - fade out
                  ],
                  stops: [0.0, 0.05, 0.95, 1.0],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  final tarefa = tarefas[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CompactTaskCard(
                      task: tarefa,
                      onTap: () {
                        // Implementar navegação ou edição da tarefa
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

