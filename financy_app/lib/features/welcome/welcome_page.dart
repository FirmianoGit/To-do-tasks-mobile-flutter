import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 65,
              child: Container(
                width: double.infinity,
                color: AppColors.greenWhite,
                child:
                  Align(
                    alignment: Alignment
                        .bottomCenter, // Alinha a imagem na parte inferior central do contêiner
                    child: Image.asset(
                      'assets/images/man.png',
                      width: 400,
                      height: 400,
                    ),
                  ),
                ),
              ),
            Expanded(
              flex: 35,
              child: Container(
                color: AppColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
