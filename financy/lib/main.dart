import 'package:financy_app/app.dart';
import 'package:financy_app/core/config/dependencies.dart';
import 'package:financy_app/data/repositories/auth/auth_repository.dart';
import 'package:financy_app/data/services/local/local_storage.dart';
import 'package:financy_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Instância de AuthRepository para restaurar sessão
  final authRepository = AuthRepository();

  // Verifica se é a primeira vez que o app é aberto
  final firstOpen = await LocalStorage.isFirstOpen();
  if (firstOpen) await LocalStorage.setFirstOpen(false);

  // Tenta restaurar a sessão do usuário
  final user = await authRepository.restaurarSessao();

  // Define a rota inicial do GoRouter
  final initialRoute = firstOpen
      ? '/welcome'
      : user != null
          ? '/tasks'
          : '/login';

  // Cria o router passando a rota inicial
  final router = createRouter(initialRoute);

  // Inicializa o app com todos os providers
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthRepository>.value(value: authRepository),
        // Aqui você pode adicionar outros providers do projeto
        ...providersRemote, // ou providersRemote
      ],
      child: App(router: router),
    ),
  );
}
