import 'package:financy_app/routing/routes.dart';
import 'package:financy_app/ui/LoginView/view_model/login_view_model.dart';
import 'package:financy_app/ui/LoginView/widget/Class/login_textform_decoration.dart';
import 'package:financy_app/ui/core/shared/Loading/loading_overlay.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:financy_app/ui/core/utils/screen_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// Página principal de login
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

// Conteúdo da tela de login (formulário, botões, etc)
class _LoginPageContent extends StatefulWidget {
  const _LoginPageContent({super.key});

  @override
  State<_LoginPageContent> createState() => _LoginPageContentState();
}

// Estado da tela de login
class _LoginPageContentState extends State<_LoginPageContent> {
  // Controllers dos campos de texto
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  // Estado do campo de senha (mostrar/ocultar)
  bool _obscureTextSenha = true;

  // Chave do formulário
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ViewModel de login
    final viewModel = context.watch<LoginViewModel>();
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.greenWhite,
      body: Stack(
        children: [
          // Conteúdo principal centralizado e rolável
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Imagem de topo
                  Image.asset(
                    'assets/images/woman.png',
                    height: screenHeight * 0.3,
                    width: screenWidth * 0.6,
                  ),
                  // Título de boas-vindas
                  Text(
                    'Bem Vindo de Volta!',
                    style: AppTextStyles.bigText.copyWith(
                      color: AppColors.green,
                      fontSize: screenWidth * 0.08,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  // Seção do formulário
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    child: Column(
                      children: [
                        // Formulário de login
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // Campo de e-mail
                              TextFormField(
                                controller: _emailController,
                                decoration: textFormFildDecoration('E-mail'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira seu e-mail';
                                  }
                                  return null;
                                },
                                style: AppTextStyles.thinText
                                    .copyWith(color: Colors.black),
                              ),
                              SizedBox(height: screenHeight * 0.008),
                              // Campo de senha
                              TextFormField(
                                controller: _senhaController,
                                decoration:
                                    textFormFildDecoration('Senha').copyWith(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureTextSenha
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: AppColors.green,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureTextSenha = !_obscureTextSenha;
                                      });
                                    },
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.05),
                                    splashColor: AppColors.greenLightTwo,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira sua senha';
                                  }
                                  return null;
                                },
                                obscureText: _obscureTextSenha,
                                style: AppTextStyles.thinText
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        // Botão "Esqueci minha senha"
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // TODO: rota para recuperação de senha
                            },
                            child: Text(
                              'Esqueci minha senha',
                              style: AppTextStyles.thinText.copyWith(
                                color: AppColors.green,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.green,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        // Botão de login
                        SizedBox(
                          width: screenWidth,
                          child: ElevatedButton(
                            onPressed: () async {
                              final loginViewModel =
                                  Provider.of<LoginViewModel>(context,
                                      listen: false);

                              if (_formKey.currentState?.validate() ?? false) {
                                final email = _emailController.text.trim();
                                final senha = _senhaController.text;

                                final sucesso = await loginViewModel.login(
                                    email: email, senha: senha);
                                if (!mounted) return;
                                if (!sucesso) {
                                  showQuickErrorAlert(
                                      context: context,
                                      title: 'Erro',
                                      text: loginViewModel.errorMessage ??
                                          'Erro ao fazer login');
                                } else {
                                  context.go(Routes.tasks);
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: AppColors.white,
                              padding: const EdgeInsets.all(12),
                              backgroundColor: AppColors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            child: Text(
                              'Continuar',
                              style: AppTextStyles.buttonText.copyWith(
                                  color: AppColors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Divisor "ou"
                        Row(
                          children: [
                            Expanded(child: Divider(color: Colors.grey[400])),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'ou',
                                style: AppTextStyles.thinText
                                    .copyWith(color: Colors.grey[600]),
                              ),
                            ),
                            Expanded(child: Divider(color: Colors.grey[400])),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Botão de login com Google
                        SizedBox(
                          width: screenWidth,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              // TODO: lógica para login com Google
                            },
                            icon: Image.asset(
                              'assets/images/google_logo.png',
                              height: 24,
                              width: 24,
                            ),
                            label: Text(
                              'Continuar com o Google',
                              style: AppTextStyles.buttonText
                                  .copyWith(color: Colors.black, fontSize: 16),
                            ),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.all(12),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              side: BorderSide(color: Colors.grey[400]!),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Overlay de loading
          if (viewModel.isLoading) ...[
            LoadingOverlay(isLoading: viewModel.isLoading)
          ]
        ],
      ),
    );
  }
}
