import 'package:flutter/material.dart';
import 'package:financy_app/data/repositories/auth/auth_repository.dart';
import 'package:financy_app/domain/models/users/users.dart';
import 'package:financy_app/data/repositories/auth/auth_repository_interface.dart';
import 'package:dio/dio.dart';
/// ViewModel responsável pela lógica de autenticação da tela de login.
/// Utiliza [ChangeNotifier] para notificar a UI sobre mudanças de estado,
/// como carregamento, sucesso ou erro.
///
/// O uso do [ChangeNotifier] permite que a interface reaja automaticamente
/// a mudanças de estado, facilitando a implementação do padrão MVVM no Flutter.
/// Assim, widgets podem escutar este ViewModel e reconstruir apenas quando necessário.
class LoginViewModel extends ChangeNotifier {
  final IAuthRepository _authRepository;

  /// Indica se uma operação de login está em andamento.
  bool _isLoading = false;

  /// Mensagem de erro a ser exibida na UI, caso ocorra alguma falha.
  String? _errorMessage;

  /// Usuário autenticado após login bem-sucedido.
  User? _user;

  /// Construtor recebe opcionalmente um [AuthRepository] (útil para testes).
  LoginViewModel({IAuthRepository? authRepository})
      : _authRepository = authRepository ?? AuthRepository();

  /// Getter para saber se está carregando.
  bool get isLoading => _isLoading;

  /// Getter para mensagem de erro.
  String? get errorMessage => _errorMessage;

  /// Getter para o usuário autenticado.
  User? get user => _user;

  /// Realiza o login utilizando o [AuthRepository].
  /// Notifica listeners sobre mudanças de estado (carregando, erro, sucesso).
  /// Retorna true se o login for bem-sucedido, false caso contrário.
  /// Realiza o login e armazena o usuário e o access_token.
  /// Retorna true se o login for bem-sucedido, false caso contrário.

Future<bool> login({required String email, required String senha}) async {
  _setLoading(true);
  await Future.delayed(const Duration(seconds: 2));
  _setErrorMessage(null);

  try {
    final user = await _authRepository.login(email: email, senha: senha);
    _user = user;
    notifyListeners();
    return true;

  } catch (e) {
    String mensagemErro = 'Erro inesperado.';

    if (e is DioException) {
      if (e.response?.statusCode == 401) {
        mensagemErro = 'Credenciais inválidas. Verifique seu e-mail e senha.';
      } else {
        mensagemErro = e.response?.data?['message']?.toString() ?? 'Erro na requisição.';
      }
    } else {
      mensagemErro = e.toString();
    }

    _setErrorMessage(mensagemErro);
    return false;

  } finally {
    _setLoading(false);
  }
}


  /// Atualiza o estado de carregamento e notifica a UI.
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Atualiza a mensagem de erro e notifica a UI.
  void _setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  /// Limpa a mensagem de erro (útil ao tentar novamente).
  void clearError() {
    _setErrorMessage(null);
  }
}
