import 'package:financy_app/mock/mock.dart';
import 'package:financy_app/ui/TasksView/widget/task_list/tasks_card.dart';
import 'package:flutter/material.dart';
import 'package:financy_app/domain/models/tasks/tasks.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Task> tarefas = TaskMockupList.getMockTasks();

    return Stack(
      children: [
        // ShaderMask aplica o gradiente de transparência em cima e embaixo
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
          blendMode: BlendMode.dstIn, // Mantém apenas a parte visível do gradiente
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemCount: tarefas.length,
            itemBuilder: (context, index) {
              final tarefa = tarefas[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TaskCard(
                  task: tarefa,
                  onTap: () {
                    debugPrint('Tarefa ${tarefa.taskId} selecionada');
                    debugPrint('${tarefa.toJson()}');
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
