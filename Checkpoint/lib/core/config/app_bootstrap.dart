import 'package:financy_app/app.dart';
import 'package:financy_app/data/repositories/auth/auth_repository.dart';
import 'package:financy_app/data/services/local/local_storage.dart';
import 'package:financy_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBootstrap extends StatelessWidget {
  const AppBootstrap({super.key});

  Future<String> _resolveInitialRoute(AuthRepository authRepository) async {
    final firstOpen = await LocalStorage.isFirstOpen();

    if (firstOpen) {
      await LocalStorage.setFirstOpen(false);
      return '/welcome';
    }

    final user = await authRepository.restaurarSessao();
    return user != null ? '/tasks' : '/login';
  }

  @override
  Widget build(BuildContext context) {
    final authRepository = context.read<AuthRepository>();

    return FutureBuilder<String>(
      future: _resolveInitialRoute(authRepository),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox(); // splash/loading inicial
        }

        return App(
          router: createRouter(snapshot.data!),
        );
      },
    );
  }
}

