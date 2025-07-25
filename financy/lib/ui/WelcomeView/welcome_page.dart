import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:financy_app/ui/WelcomeView/personalized/classes/line_clipper.dart';
import 'package:financy_app/ui/WelcomeView/personalized/widgets/faca_login_button.dart';
import 'package:financy_app/ui/WelcomeView/personalized/widgets/welcome_button.dart';
import 'package:financy_app/ui/WelcomeView/personalized/widgets/welcome_text.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: ClipPath(
              clipper: InclinedClipper(),
              child: Container(
                width: double.infinity,
                color: AppColors.greenWhite,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                      bottom: screenHeight * 0.03,
                      child: Image.asset(
                        'assets/images/man.png',
                        width: screenWidth * 0.7,
                        height: screenHeight * 0.50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const WelcomeText(),
                  SizedBox(height: screenHeight * 0.02),
                  WelcomeButton(screenWidth: screenWidth),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Já tem uma conta?',
                        style: AppTextStyles.thinText.copyWith(color: Colors.black),
                      ),
                      const SizedBox(width: 8),
                      const FacaLoginButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
