import 'package:financy_app/features/Login/Personalized/Class/login_textform_decoration.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>(); // Chave do formulário para validação
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.05),
      child: Form(
        key: _formKey, // Associa a chave ao formulário
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
            ),
          ],
        ),
      ),
    );
  }

}
