import 'package:financy_app/data/repositories/tasks/tasks_repository.dart';
import 'package:financy_app/data/services/local_notifications/local_notifications.dart';
import 'package:financy_app/domain/models/tasks/tasks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateTaskViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<bool> adicionarTarefa(BuildContext context, Task tarefa) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      if (context.mounted) {
        final tasksRepository = context.read<TasksRepository>();
        await tasksRepository.addTask(tarefa);
        final notificationService = context.read<NotificationService>();
        notificationService.showSimpleNotification(title: "Tarefa Adicionada", body: "Você adicionou a tarefa: ${tarefa.titulo}");
      }

      _isLoading = false;
      notifyListeners();
      return true; // Indicate success
    } on Exception catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false; // Indicate failure
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}