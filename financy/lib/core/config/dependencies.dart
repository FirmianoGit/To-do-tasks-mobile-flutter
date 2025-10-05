import 'package:financy_app/data/services/local/local_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../data/repositories/auth/auth_repository.dart';
import '../../data/services/api/api_client.dart';

List<SingleChildWidget> _sharedProviders = [
  // Aqui você pode colocar casos de uso que dependem de múltiplos repos
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
