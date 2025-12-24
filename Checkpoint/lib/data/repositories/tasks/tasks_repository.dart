import 'package:flutter/material.dart';
import 'package:financy_app/domain/models/tasks/tasks.dart';
import 'package:financy_app/mock/mock.dart';

/// Provider responsável pelo gerenciamento de estado da lista de tarefas
///
/// Este ChangeNotifier:
/// - Carrega as tarefas iniciais do mock
/// - Permite adicionar novas tarefas
/// - Permite remover tarefas
/// - Permite atualizar tarefas existentes
/// - Notifica os listeners sempre que há mudanças
class TasksRepository extends ChangeNotifier {
  /// Lista interna de tarefas
  List<Task> _tasks = [];

  /// Getter para acessar as tarefas (lista não modificável de fora)
  List<Task> get tasks => List.unmodifiable(_tasks);

  /// Obtém a quantidade total de tarefas
  int get taskCount => _tasks.length;

  /// Inicializa o provider carregando as tarefas mock
  void initialize() {
    _tasks = TaskMockupList.getMockTasks();
    notifyListeners();
  }

  /// Adiciona uma nova tarefa à lista
  ///
  /// Parâmetros:
  ///   - task: A tarefa a ser adicionada
  ///
  /// Retorna true se adicionada com sucesso
  bool addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
    return true;
  }

  /// Adiciona múltiplas tarefas de uma vez
  ///
  /// Parâmetros:
  ///   - newTasks: Lista de tarefas a serem adicionadas
  void addMultipleTasks(List<Task> newTasks) {
    _tasks.addAll(newTasks);
    notifyListeners();
  }

  /// Remove uma tarefa pelo ID
  ///
  /// Parâmetros:
  ///   - taskId: ID da tarefa a ser removida
  ///
  /// Retorna true se removida com sucesso, false se não encontrada
  bool removeTaskById(int taskId) {
    final initialLength = _tasks.length;
    _tasks.removeWhere((task) => task.taskId == taskId);

    if (_tasks.length < initialLength) {
      notifyListeners();
      return true;
    }
    return false;
  }

  /// Remove uma tarefa específica
  ///
  /// Parâmetros:
  ///   - task: A tarefa a ser removida
  ///
  /// Retorna true se removida com sucesso
  bool removeTask(Task task) {
    return removeTaskById(task.taskId);
  }

  /// Atualiza uma tarefa existente
  ///
  /// Parâmetros:
  ///   - updatedTask: A tarefa atualizada (deve ter o mesmo ID)
  ///
  /// Retorna true se atualizada com sucesso, false se não encontrada
  bool updateTask(Task updatedTask) {
    final index = _tasks.indexWhere((task) => task.taskId == updatedTask.taskId);

    if (index != -1) {
      _tasks[index] = updatedTask;
      notifyListeners();
      return true;
    }
    return false;
  }

  /// Obtém uma tarefa específica pelo ID
  ///
  /// Parâmetros:
  ///   - taskId: ID da tarefa
  ///
  /// Retorna a tarefa encontrada ou null se não existir
  Task? getTaskById(int taskId) {
    try {
      return _tasks.firstWhere((task) => task.taskId == taskId);
    } catch (e) {
      return null;
    }
  }

  /// Filtra tarefas por status
  ///
  /// Parâmetros:
  ///   - statusId: ID do status a filtrar
  ///
  /// Retorna lista de tarefas com o status especificado
  List<Task> filterByStatus(int statusId) {
    return _tasks.where((task) => task.statusId == statusId).toList();
  }

  /// Filtra tarefas por prioridade
  ///
  /// Parâmetros:
  ///   - prioridade: Nível de prioridade (1, 2, 3, etc)
  ///
  /// Retorna lista de tarefas com a prioridade especificada
  List<Task> filterByPriority(int prioridade) {
    return _tasks.where((task) => task.prioridade == prioridade).toList();
  }

  /// Pesquisa tarefas pelo título ou descrição
  ///
  /// Parâmetros:
  ///   - query: Texto a pesquisar
  ///
  /// Retorna lista de tarefas que contêm o texto no título ou descrição
  List<Task> searchTasks(String query) {
    final lowerQuery = query.toLowerCase();
    return _tasks.where((task) =>
      task.titulo.toLowerCase().contains(lowerQuery) ||
      task.descricao.toLowerCase().contains(lowerQuery)
    ).toList();
  }

  /// Limpa todas as tarefas
  void clearAllTasks() {
    _tasks.clear();
    notifyListeners();
  }

  /// Recarrega as tarefas do mock (útil para reset)
  void reload() {
    _tasks = TaskMockupList.getMockTasks();
    notifyListeners();
  }
}
