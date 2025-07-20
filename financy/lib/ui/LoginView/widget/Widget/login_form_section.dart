import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
                const SizedBox(height: 5),
                TextFormField(
                  controller: _senhaController,
                  decoration: textFormFildDecoration('Senha'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua senha';
                    }
                    return null;
                  },
                  style: AppTextStyles.thinText.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: screenWidth * 0.8,
            child: ElevatedButton( 
              onPressed: () async {
                final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);

                if (_formKey.currentState?.validate() ?? false) {
                  final email = _emailController.text.trim();
                  final senha = _senhaController.text;

                  final sucesso = await loginViewModel.login(email: email, senha: senha);
                  print(sucesso);
                  if (!sucesso) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(loginViewModel.errorMessage ?? 'Erro ao fazer login')),
                    );
                  } else {
                    // Aqui você pode navegar para outra tela ou executar outra ação após o login bem-sucedido
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.greenLightTwo,
                padding: const EdgeInsets.all(12),
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              ),
              child: Text(
                'Continuar ',
                style: AppTextStyles.buttonText.copyWith(color: AppColors.greenLightTwo, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
