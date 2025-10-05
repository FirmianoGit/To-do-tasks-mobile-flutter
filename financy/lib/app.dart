import 'package:financy_app/ui/CreateAcountView/ViewModel/create_acount_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:financy_app/ui/LoginView/view_model/login_view_model.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  final GoRouter router;
  const App({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => CreateAccountViewModel()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
