import 'package:flutter/material.dart';
import 'package:financy_app/data/repositories/auth/auth_repository.dart';
import 'package:financy_app/domain/models/users/users.dart';
import 'package:financy_app/data/repositories/auth/auth_repository_interface.dart';
import 'package:financy_app/core/exceptions/exceptions.dart';

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
    } on UnauthorizedException catch (e) {
      _setErrorMessage('Credenciais inválidas. Verifique seu e-mail e senha.');
      return false;
    } on ErroServidorException catch (e) {
      _setErrorMessage('Erro interno do servidor. Tente novamente mais tarde.');
      return false;
    } on ErroJWTException catch (e) {
      _setErrorMessage('Problema com o token de autenticação. Tente novamente.');
      return false;
    } on ErroDesconhecidoException catch (e) {
      _setErrorMessage('Erro inesperado no servidor');
      return false;
    } catch (e) {
      _setErrorMessage('Erro inesperado: ${e.toString()}');
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
