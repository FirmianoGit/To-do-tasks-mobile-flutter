import 'package:financy_app/ui/LoginView/view_model/login_view_model.dart';
import 'package:financy_app/ui/LoginView/widget/Widget/login_form_section.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final  double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    


    return Scaffold(
      resizeToAvoidBottomInset: true, // Evita que o layout ajuste com o teclado
      backgroundColor: AppColors.greenWhite,
      body: Center(
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
                      'Bem Vindo de Volta!',
                      style: AppTextStyles.bigText.copyWith(
                        color: AppColors.green,
                        fontSize: screenWidth *
                            0.08, // Ajuste o tamanho da fonte proporcionalmente
                      ),
                    ),
                    SizedBox(
                        height: screenHeight *
                            0.03),
                    ChangeNotifierProvider(
                      create: (_) => LoginViewModel(),
                      child: const LoginFormSection(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
