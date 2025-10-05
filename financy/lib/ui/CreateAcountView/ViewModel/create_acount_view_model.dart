import 'package:flutter/material.dart';
import 'package:financy_app/data/repositories/auth/auth_repository.dart';
import 'package:financy_app/data/repositories/auth/auth_repository_interface.dart';
import 'package:financy_app/core/exceptions/exceptions.dart';

/// ViewModel responsável pela lógica de criação de conta.
/// Utiliza [ChangeNotifier] para notificar a UI sobre mudanças de estado,
/// como carregamento, sucesso ou erro.
class CreateAccountViewModel extends ChangeNotifier {
  final IAuthRepository _authRepository;

  bool _isLoading = false;
  String? _errorMessage;

  /// Construtor recebe opcionalmente um [AuthRepository] (útil para testes).
  CreateAccountViewModel({IAuthRepository? authRepository})
      : _authRepository = authRepository ?? AuthRepository();

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  /// Realiza a criação de conta utilizando o [AuthRepository].
  /// Notifica listeners sobre mudanças de estado (carregando, erro, sucesso).
  /// Retorna true se a criação for bem-sucedida, false caso contrário.
  Future<bool> criarConta({
    required String email,
    required String username,
    required String senha,
  }) async {
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    _setErrorMessage(null);

    try {
      await _authRepository.registrar(
        email: email,
        nomeUsuario: username,
        senha: senha,
      );
      notifyListeners();
      return true;
    } on ErroEmailRegistradoException {
      _setErrorMessage('E-mail ou nome de usuário já cadastrados.');
      return false;
    } on ErroServidorException catch (e) {
      _setErrorMessage('Erro interno do servidor. Tente novamente mais tarde. $e');
      return false;
    } on ErroDesconhecidoException catch (e) {
      _setErrorMessage('Erro inesperado ao registrar usuário. $e');
      return false;
    } catch (e) {
      _setErrorMessage('Erro inesperado ao registrar usuário. $e');
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

