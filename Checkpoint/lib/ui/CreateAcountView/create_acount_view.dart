import 'package:financy_app/routing/routes.dart';
import 'package:financy_app/ui/CreateAcountView/ViewModel/create_acount_view_model.dart';
import 'package:financy_app/ui/core/shared/Loading/loading_overlay.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:financy_app/ui/LoginView/widget/Class/login_textform_decoration.dart';
import 'package:financy_app/ui/core/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:financy_app/ui/core/utils/screen_dialogs.dart';

class CreateAcountPage extends StatelessWidget {
  const CreateAcountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CreateAccountViewModel(),
      child: const _CreateAcountPageContent(),
    );
  }
}

class _CreateAcountPageContent extends StatefulWidget {
  const _CreateAcountPageContent();

  @override
  State<_CreateAcountPageContent> createState() => _CreateAcountPageContentState();
}

class _CreateAcountPageContentState extends State<_CreateAcountPageContent> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController = TextEditingController();

  bool _obscureSenha = true;
  bool _obscureConfirmarSenha = true;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CreateAccountViewModel>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Imagem de topo
                  Image.asset(
                    'assets/images/woman.png',
                    height: screenHeight * 0.25,
                    width: screenWidth * 0.5,
                  ),
                  // Título
                  Text(
                    'Vem com a gente!',
                    style: AppTextStyles.bigText.copyWith(
                      color: AppColors.green,
                      fontSize: screenWidth * 0.08,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  // Formulário de criação de conta
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Campo de Email
                          TextFormField(
                            controller: _emailController,
                            decoration: textFormFildDecoration('E-mail').copyWith(
                              prefixIcon: Icon(Icons.email_outlined, color: AppColors.green),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: Validations.validateEmail,
                            style: AppTextStyles.thinText.copyWith(color: Colors.black),
                          ),
                          SizedBox(height: screenHeight * 0.013),
                          // Campo de Nome de Usuário
                          TextFormField(
                            controller: _usernameController,
                            decoration: textFormFildDecoration('Nome de usuário').copyWith(
                              prefixIcon: Icon(Icons.person_outline, color: AppColors.green),
                            ),
                            validator: Validations.validateUsername,
                            style: AppTextStyles.thinText.copyWith(color: Colors.black),
                          ),
                          SizedBox(height: screenHeight * 0.013),
                          // Campo de Senha
                          TextFormField(
                            controller: _senhaController,
                            obscureText: _obscureSenha,
                            decoration: textFormFildDecoration('Senha').copyWith(
                              prefixIcon: Icon(Icons.lock_outline, color: AppColors.green),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureSenha ? Icons.visibility_off : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureSenha = !_obscureSenha;
                                  });
                                },
                              ),
                            ),
                            validator: Validations.validatePassword,
                            style: AppTextStyles.thinText.copyWith(color: Colors.black),
                          ),
                          SizedBox(height: screenHeight * 0.013),
                          // Campo de Confirmar Senha
                          TextFormField(
                            controller: _confirmarSenhaController,
                            obscureText: _obscureConfirmarSenha,
                            decoration: textFormFildDecoration('Confirmar senha').copyWith(
                              prefixIcon: Icon(Icons.lock_outline, color: AppColors.green),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureConfirmarSenha ? Icons.visibility_off : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureConfirmarSenha = !_obscureConfirmarSenha;
                                  });
                                },
                              ),
                            ),
                            validator: (value) => Validations.validateConfirmPassword(
                              value, _senhaController.text),
                            style: AppTextStyles.thinText.copyWith(color: Colors.black),
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          // Botão de criar conta
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState?.validate() ?? false) {
                                  final sucesso = await viewModel.criarConta(
                                    email: _emailController.text.trim(),
                                    username: _usernameController.text.trim(),
                                    senha: _senhaController.text,
                                  );
                                  if (!mounted) return;
                                  if (sucesso) {
                                    context.go('/tasks');
                                  } else if (viewModel.errorMessage != null) {
                                    showQuickErrorAlert(
                                      context: context,
                                      title: 'Erro ao criar conta',
                                      text: viewModel.errorMessage!,
                                    );
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: AppColors.white,
                                backgroundColor: AppColors.green,
                                padding: const EdgeInsets.all(14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                'Criar Conta',
                                style: AppTextStyles.buttonText.copyWith(
                                  color: AppColors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          // Link para login
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Já tem uma conta?',
                                style: AppTextStyles.thinText.copyWith(color: Colors.grey[700]),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.go(Routes.login);
                                },
                                child: Text(
                                  'Entrar',
                                  style: AppTextStyles.thinText.copyWith(color: AppColors.green),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Overlay de loading
          if (viewModel.isLoading) LoadingOverlay(isLoading: viewModel.isLoading),
        ],
      ),
    );
  }
}
