import 'package:financy_app/routing/routes.dart';
import 'package:financy_app/ui/LoginView/widget/login_screen.dart';
import 'package:financy_app/ui/TasksView/tasks_screen.dart';
import 'package:financy_app/ui/WelcomeView/welcome_page.dart';
import 'package:financy_app/ui/core/shared/app_scaffold.dart';
import 'package:financy_app/ui/teste/teste.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Chave global para o Navigator principal da aplicação.
// Isso permite controlar a navegação globalmente, útil para navegação fora do contexto de widgets.
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

// Duração padrão das transições de página (em milissegundos).
const int _transitionDuration = 400;

// Configuração do GoRouter, responsável por gerenciar as rotas da aplicação.
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  // Define a rota inicial ao abrir o app.
  initialLocation: Routes.welcome,
  routes: [
    // Rota para a tela de boas-vindas.
    GoRoute(
      path: Routes.welcome,
      builder: (context, state) => const WelcomePage(),
    ),
    // Rota para a tela de login, com transição customizada (fade).
    GoRoute(
      path: Routes.login,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const LoginPage(),
          transitionDuration: const Duration(milliseconds: _transitionDuration),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),
    // Rota principal com navegação em abas (StatefulShellRoute).
    // Cada aba é um branch, e cada branch pode ter suas próprias rotas.
    StatefulShellRoute.indexedStack(
      // Widget que recebe o navigationShell para controlar a navegação entre as abas.
      builder: (context, state, navigationShell) =>
          ScaffoldScreen(navigationContainer: navigationShell),
      branches: [
        // Primeira aba: Tarefas
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.tasks,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const TasksScreen(),
              transitionDuration:
                  const Duration(milliseconds: _transitionDuration),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            ),
          ),
        ]),
        // Segunda aba: Tela de teste azul
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.teste1,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const BlueScreen(),
              transitionDuration:
                  const Duration(milliseconds: _transitionDuration),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            ),
          ),
        ]),
        // Terceira aba: Tela de teste verde
        StatefulShellBranch(routes: [
          GoRoute(
            path: Routes.teste2,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const GreenScreen(),
              transitionDuration:
                  const Duration(milliseconds: _transitionDuration),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            ),
          ),
        ]),
      ],
    ),
  ],
);
