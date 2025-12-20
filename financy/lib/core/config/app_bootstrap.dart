import 'package:financy_app/app.dart';
import 'package:financy_app/data/repositories/auth/auth_repository.dart';
import 'package:financy_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBootstrap extends StatelessWidget {
  const AppBootstrap({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = context.read<AuthRepository>();

    return FutureBuilder(
      future: authRepository.restaurarSessao(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox(); // splash
        }

        final user = snapshot.data;
        final initialRoute =
            user != null ? '/tasks' : '/login';

        return App(
          router: createRouter(initialRoute),
        );
      },
    );
  }
}
