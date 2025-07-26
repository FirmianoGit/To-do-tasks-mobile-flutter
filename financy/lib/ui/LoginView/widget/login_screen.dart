import 'package:financy_app/ui/LoginView/view_model/login_view_model.dart';
import 'package:financy_app/ui/LoginView/widget/Widget/login_form_section.dart';
import 'package:financy_app/ui/core/shared/Loading/loading_overlay.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: const _LoginPageContent(),
    );
  }
}

class _LoginPageContent extends StatelessWidget {
  const _LoginPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginViewModel>();

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.greenWhite,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/woman.png',
                    height: screenHeight * 0.3,
                    width: screenWidth * 0.6,
                  ),
                  Text(
                    'Bem Vindo de Volta!',
                    style: AppTextStyles.bigText.copyWith(
                      color: AppColors.green,
                      fontSize: screenWidth * 0.08,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  const LoginFormSection(),
                ],
              ),
            ),
          ),

          // Overlay de loading com blur
          if (viewModel.isLoading) ...[
            LoadingOverlay(isLoading: viewModel.isLoading)
          ]
        ],
      ),
    );
  }
}
