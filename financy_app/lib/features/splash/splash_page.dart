import 'dart:async';
import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:financy_app/features/splash/Personalized/custom_route_animation.dart';
import 'package:financy_app/features/splash/Personalized/splash_title.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        createRoute(), // Chama a função que cria a transição personalizada
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.greengGradient,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 190),
          const Expanded(child: Center(child: SplashTitle())),
          Image.asset(
            alignment: Alignment.bottomCenter,
            'assets/images/unifagoc_logo.png',
            width: 100.0,
            height: 200.0,
          ),
        ]),
      ),
    );
  }
}
