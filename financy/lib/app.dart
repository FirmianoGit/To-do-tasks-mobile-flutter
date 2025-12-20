import 'package:financy_app/ui/core/shared/Loading/loading_controller.dart';
import 'package:financy_app/ui/core/shared/loading/loading_wrapper.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final GoRouter router;
  const App({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoadingController(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
        locale: const Locale('pt', 'BR'),
        theme: AppTheme.theme,

        // 👇 AQUI entra o Wrapper
        builder: (context, child) {
          return AppLoadingWrapper(
            child: child!,
          );
        },
      ),
    );
  }
}
