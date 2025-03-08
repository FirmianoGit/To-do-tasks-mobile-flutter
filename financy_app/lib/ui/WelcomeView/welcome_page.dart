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

    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          Expanded(
            flex: 65,
            child: ClipPath(
              clipper: InclinedClipper(),
              child: Container(
                  width: double.infinity,
                  color: AppColors.greenWhite,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(
                        bottom: 30,
                        child: Image.asset(
                          'assets/images/man.png',
                          width: 420,
                          height: 420,
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Expanded(
              flex: 35,
              child: Column(
                children: [
                  const WelcomeText(),
                  const SizedBox(
                    height: 20,
                  ),
                  WelcomeButton(screenWidth: screenWidth),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Já tem uma conta?',
                        style: AppTextStyles.thinText
                            .copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const FacaLoginButton()
                    ],
                  )
                ],
              )),
        ]),
      ),
    );
  }
}
