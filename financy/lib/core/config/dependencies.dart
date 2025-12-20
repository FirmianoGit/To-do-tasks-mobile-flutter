import 'package:financy_app/core/State/app_loading_controller.dart';
import 'package:financy_app/data/repositories/tasks/tasks_repository.dart';
import 'package:financy_app/data/services/local/local_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../data/repositories/auth/auth_repository.dart';
import '../../data/services/api/api_client.dart';
import '../../ui/CreateTaskView/view_model/create_task_view_model.dart';

List<SingleChildWidget> _sharedProviders = [
  /// TasksRepository: Gerenciador de estado da lista de tarefas
  /// ChangeNotifierProvider garante que qualquer widget que use este provider
  /// será reconstruído automaticamente quando as tarefas mudarem
  ChangeNotifierProvider(
    create: (context) {
      final tasksRepository = TasksRepository();
      tasksRepository.initialize(); // Carrega as tarefas iniciais
      return tasksRepository;
    },
  ),
  
  /// CreateTaskViewModel: ViewModel para adicionar novas tarefas
  /// Atua como intermediário entre a View e o Repository
  ChangeNotifierProvider(
    create: (context) => CreateTaskViewModel(),
  ),
  // Aqui você pode colocar outros casos de uso que dependem de múltiplos repos

  ChangeNotifierProvider(
    create: (context) => AppLoadingController(),
  ),
  
];

/// Dependências para ambiente remoto
List<SingleChildWidget> get providersRemote {
  return [
    Provider(create: (_) => ApiClient()),
    Provider(create: (_) => LocalStorage()),
    ChangeNotifierProvider(
      create: (context) =>
          AuthRepository(apiClient: context.read()),

    ),
    ..._sharedProviders,
  ];
}

/// Dependências para ambiente local (desenvolvimento)
// List<SingleChildWidget> get providersLocal {
//   return [
//     ChangeNotifierProvider.value(value: AuthRepositoryDev() as AuthRepository),
//     Provider.value(value: LocalDataService()),
//     ..._sharedProviders,
//   ];
// }
