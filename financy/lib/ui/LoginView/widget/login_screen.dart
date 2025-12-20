import 'package:financy_app/core/State/app_loading_controller.dart';
import 'package:financy_app/routing/routes.dart';
import 'package:financy_app/ui/LoginView/view_model/login_view_model.dart';
import 'package:financy_app/ui/LoginView/widget/Class/login_textform_decoration.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:financy_app/ui/core/utils/screen_dialogs.dart';
import 'package:financy_app/ui/core/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

class _LoginPageContent extends StatefulWidget {
  const _LoginPageContent();

  @override
  State<_LoginPageContent> createState() => _LoginPageContentState();
}

class _LoginPageContentState extends State<_LoginPageContent> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  bool _obscureTextSenha = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LoginViewModel>();
    final loading = context.read<AppLoadingController>();

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.greenWhite,
      body: Center(
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
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            decoration: textFormFildDecoration('E-mail'),
                            keyboardType: TextInputType.emailAddress,
                            validator: Validations.validateEmail,
                          ),
                          SizedBox(height: screenHeight * 0.008),
                          TextFormField(
                            controller: _senhaController,
                            decoration:
                                textFormFildDecoration('Senha').copyWith(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureTextSenha
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureTextSenha = !_obscureTextSenha;
                                  });
                                },
                              ),
                            ),
                            validator: Validations.validatePassword,
                            obscureText: _obscureTextSenha,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    SizedBox(
                      width: screenWidth,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (!(_formKey.currentState?.validate() ?? false)) {
                            return;
                          }

                          loading.show();

                          try {
                            final sucesso = await viewModel.login(
                              email: _emailController.text.trim(),
                              senha: _senhaController.text,
                            );

                            if (!mounted) return;

                            if (sucesso) {
                              context.go(Routes.tasks);
                            } else {
                              showQuickErrorAlert(
                                context: context,
                                title: 'Erro',
                                text: viewModel.errorMessage ??
                                    'Erro ao fazer login',
                              );
                            }
                          } finally {
                            loading.hide();
                          }
                        },
                        child: const Text('Continuar'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
