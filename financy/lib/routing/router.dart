import 'package:financy_app/routing/routes.dart';
import 'package:financy_app/ui/CreateAcountView/create_acount_view.dart';
import 'package:financy_app/ui/LoginView/widget/login_screen.dart';
import 'package:financy_app/ui/TasksView/tasks_screen.dart';
import 'package:financy_app/ui/WelcomeView/welcome_page.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/CreateTaskView/create_task_screen.dart';
import 'package:financy_app/ui/teste/teste.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
const int transitionDuration = 400;

/// Cria o GoRouter com base na rota inicial
GoRouter createRouter(String initialRoute) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: initialRoute,
    routes: [
      GoRoute(
        path: Routes.welcome,
        builder: (_, __) => const WelcomePage(),
      ),
      GoRoute(
        path: Routes.login,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginPage(),
          transitionDuration: const Duration(milliseconds: transitionDuration),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: Routes.createAcount,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const CreateAcountPage(),
          transitionDuration: const Duration(milliseconds: transitionDuration),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => PersistentTabView.router(
          
          tabs: [
            PersistentRouterTabConfig(
              item: ItemConfig(
                icon: const Icon(Icons.view_agenda_outlined),
                title: "Tarefas",
                activeForegroundColor: AppColors.green,
              ),
            ),
            PersistentRouterTabConfig(
              item: ItemConfig(
                icon: const Icon(
                  Icons.add,
                  color: AppColors.greenWhite,
                ),
                activeForegroundColor: AppColors.green,
              ),
            ),
            PersistentRouterTabConfig(
              item: ItemConfig(
                icon: const Icon(Icons.equalizer_outlined),
                title: "DashBoard",
                activeForegroundColor: AppColors.green,
              ),
            ),
          ],
          navBarBuilder: (navBarConfig) => Style13BottomNavBar(
            navBarConfig: navBarConfig,
            navBarDecoration: NavBarDecoration(
              color: Colors.white,
              
            ),
          ),
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: Routes.tasks,
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: const TasksScreen(),
                transitionDuration:
                    const Duration(milliseconds: transitionDuration),
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
              path: Routes.createTaskScreen,
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                child: const CreateTaskScreen(),
                transitionDuration:
                    const Duration(milliseconds: transitionDuration),
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
                    const Duration(milliseconds: transitionDuration),
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
}
