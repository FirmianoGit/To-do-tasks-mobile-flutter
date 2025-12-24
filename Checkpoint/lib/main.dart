import 'package:financy_app/core/config/app_bootstrap.dart';
import 'package:financy_app/core/config/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o app com todos os providers
  runApp(
  MultiProvider(
    providers: providersRemote,
    child: const AppBootstrap(),
  ),
);

}
