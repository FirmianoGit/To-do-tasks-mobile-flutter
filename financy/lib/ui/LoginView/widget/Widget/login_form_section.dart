import 'package:financy_app/routing/routes.dart';
import 'package:financy_app/ui/core/utils/screen_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:financy_app/ui/LoginView/view_model/login_view_model.dart';
import 'package:financy_app/ui/core/theme/app_colors.dart';
import 'package:financy_app/ui/core/theme/app_text_styles.dart';
import 'package:financy_app/ui/LoginView/widget/Class/login_textform_decoration.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  bool _obscureTextSenha = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu e-mail';
                    }
                    return null;
                  },
                  style: AppTextStyles.thinText.copyWith(color: Colors.black),
                ),
                SizedBox(height: screenHeight * 0.005),
                TextFormField(
                  controller: _senhaController,
                  decoration: textFormFildDecoration('Senha').copyWith(
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
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
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
                  style: AppTextStyles.thinText.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          //SizedBox(height: screenHeight * 0.005),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                   //TODO: fazer a rota de navegação para a pagina que vai ser criada de recuperação de senha
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
          SizedBox(
            width: screenWidth,
            child: ElevatedButton(
              onPressed: () async {
                final loginViewModel =
                    Provider.of<LoginViewModel>(context, listen: false);

                if (_formKey.currentState?.validate() ?? false) {
                  final email = _emailController.text.trim();
                  final senha = _senhaController.text;

                  final sucesso =
                      await loginViewModel.login(email: email, senha: senha);
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
                style: AppTextStyles.buttonText
                    .copyWith(color: AppColors.white, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: Divider(color: Colors.grey[400])),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'ou',
                  style:
                      AppTextStyles.thinText.copyWith(color: Colors.grey[600]),
                ),
              ),
              Expanded(child: Divider(color: Colors.grey[400])),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: screenWidth,
            child: OutlinedButton.icon(
              onPressed: () {
                // TODO: Adicione aqui a lógica para login com Google
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
    );
  }
}
