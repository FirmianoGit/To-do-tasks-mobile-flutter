import 'package:financy_app/routing/routes.dart';
import 'package:financy_app/ui/LoginView/widget/login_screen.dart';
import 'package:financy_app/ui/WelcomeView/welcome_page.dart';
import 'package:financy_app/ui/core/Plugins/App_bottom_navigation_bar.dart';
import 'package:financy_app/ui/teste/teste.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

const int _transitionDuration = 4000;

// GoRouter configuration
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.teste,
  routes: [
    GoRoute(
      path: Routes.welcome,
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/login',
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
            TestScreen(navigationContainer: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: Routes.teste,
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: const RedScreen(),
                transitionDuration: const Duration(milliseconds: _transitionDuration),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
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
                transitionDuration: const Duration(milliseconds: _transitionDuration),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
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
                transitionDuration: const Duration(milliseconds: _transitionDuration),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            ),
          ]),
          
        ])
  ],
);
