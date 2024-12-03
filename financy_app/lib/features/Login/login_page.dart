import 'package:financy_app/commom/constants/app_colors.dart';
import 'package:financy_app/commom/constants/app_text_styles.dart';
import 'package:financy_app/features/Login/Personalized/Widget/login_button.dart';
import 'package:financy_app/features/Login/Personalized/Widget/login_form.dart';
import 'package:financy_app/features/Login/Personalized/Widget/main_container.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false, // Evita que o layout ajuste com o teclado
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            flex: 70, // Ajuste a proporção conforme necessário
            child: buildTopSection(
              child: SingleChildScrollView(
                child: Column(
                  // Centraliza o conteúdo verticalmente
                  children: [ // Ajuste o espaçamento acima do texto
                    Image.asset(
                      'assets/images/woman.png',
                      height: screenHeight *
                          0.3, // Ajuste a altura da imagem proporcionalmente
                      width: screenWidth *
                          0.6, // Ajuste a largura da imagem proporcionalmente
                    ),
                    Text(
                      'Entre com seus dados',
                      style: AppTextStyles.bigText.copyWith(
                        color: AppColors.white,
                        fontSize: screenWidth *
                            0.08, // Ajuste o tamanho da fonte proporcionalmente
                      ),
                    ),
                    SizedBox(
                        height: screenHeight *
                            0.03),
                    const LoginForm(),
                    const LoginButton()
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 20, // Ajuste a proporção conforme necessário
            child:  Image.asset('assets/images/unifagoc_logo_verde.png',
            height: screenHeight * 0.2,
            width: screenWidth * 0.2,
            ), // Espaço fixo no fundo
          ),
        ],
      ),
    );
  }
}
