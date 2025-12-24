import 'package:financy_app/data/repositories/tasks/tasks_repository.dart';
import 'package:financy_app/domain/models/tasks/tasks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Exemplos de uso do TaskProvider para gerenciar tarefas
///
/// Este arquivo demonstra os padrões de uso mais comuns

class TaskProviderExamples {
  /// Exemplo 1: Adicionar uma nova tarefa
  static void addNewTaskExample(BuildContext context) {
    final taskProvider = context.read<TasksRepository>();

    final newTask = Task(
      taskId: 21,
      titulo: 'Minha nova tarefa',
      descricao: 'Descrição da tarefa',
      statusId: 1,
      usuarioId: 121,
      criadoEm: DateTime.now(),
      prioridade: 2,
    );

    taskProvider.addTask(newTask);
  }

  /// Exemplo 2: Remover uma tarefa
  static void removeTaskExample(BuildContext context, int taskId) {
    final taskProvider = context.read<TasksRepository>();

    final removed = taskProvider.removeTaskById(taskId);

    if (removed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tarefa removida com sucesso')),
      );
    }
  }

  /// Exemplo 3: Atualizar uma tarefa existente
  static void updateTaskExample(BuildContext context, Task updatedTask) {
    final taskProvider = context.read<TasksRepository>();

    final updated = taskProvider.updateTask(updatedTask);

    if (updated) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tarefa atualizada com sucesso')),
      );
    }
  }

  /// Exemplo 4: Obter uma tarefa específica
  static void getTaskExample(BuildContext context, int taskId) {
    final taskProvider = context.read<TasksRepository>();

    final task = taskProvider.getTaskById(taskId);

    if (task != null) {
      print('Tarefa encontrada: ${task.titulo}');
    } else {
      print('Tarefa não encontrada');
    }
  }

  /// Exemplo 5: Pesquisar tarefas
  static List<Task> searchTasksExample(BuildContext context, String query) {
    final taskProvider = context.read<TasksRepository>();

    return taskProvider.searchTasks(query);
  }

  /// Exemplo 6: Filtrar por status
  static List<Task> filterByStatusExample(BuildContext context, int statusId) {
    final taskProvider = context.read<TasksRepository>();

    return taskProvider.filterByStatus(statusId);
  }

  /// Exemplo 7: Filtrar por prioridade
  static List<Task> filterByPriorityExample(
      BuildContext context, int prioridade) {
    final taskProvider = context.read<TasksRepository>();

    return taskProvider.filterByPriority(prioridade);
  }

  /// Exemplo 8: Usar o provider com Consumer (reconstruir widget ao atualizar)
  ///
  /// ```dart
  /// Consumer<TaskProvider>(
  ///   builder: (context, taskProvider, child) {
  ///     return Text('Total de tarefas: ${taskProvider.taskCount}');
  ///   },
  /// )
  /// ```

  /// Exemplo 9: Usar o provider com Selector (selecionar parte do estado)
  ///
  /// ```dart
  /// Selector<TaskProvider, int>(
  ///   selector: (context, taskProvider) => taskProvider.taskCount,
  ///   builder: (context, taskCount, child) {
  ///     return Text('Total: $taskCount');
  ///   },
  /// )
  /// ```

  /// Exemplo 10: Limpar todas as tarefas
  static void clearAllTasksExample(BuildContext context) {
    final taskProvider = context.read<TasksRepository>();

    taskProvider.clearAllTasks();
  }
}
