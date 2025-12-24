import 'package:financy_app/data/repositories/tasks/tasks_repository.dart';
import 'package:financy_app/domain/models/tasks/tasks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateTaskViewModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> adicionarTarefa(BuildContext context, Task tarefa) async {
    try {
      _isLoading = true;
      notifyListeners();

      if (context.mounted) {
        final tasksRepository = context.read<TasksRepository>();
        tasksRepository.addTask(tarefa);
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }
}