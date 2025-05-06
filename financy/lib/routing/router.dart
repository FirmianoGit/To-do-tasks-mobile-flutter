import 'package:financy_app/routing/routes.dart';
import 'package:financy_app/ui/LoginView/widget/login_screen.dart';
import 'package:financy_app/ui/TasksView/tasks_screen.dart';
import 'package:financy_app/ui/WelcomeView/welcome_page.dart';
import 'package:financy_app/ui/core/widgets/App_scaffold.dart';
import 'package:financy_app/ui/teste/teste.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

const int _transitionDuration = 800;

// GoRouter configuration
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.tasks,
  routes: [
    GoRoute(
      path: Routes.welcome,
      builder: (context, state) => const WelcomePage(),
    ),
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
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ScaffoldScreen(navigationContainer: navigationShell),
      branches: [
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
