import 'package:financy_app/data/services/api/api_client.dart';
import 'package:financy_app/domain/models/users/users.dart';

/// Repositório responsável pelas operações de autenticação do usuário.
class AuthRepository {
  final ApiClient _apiClient;

  AuthRepository({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  /// Realiza o login do usuário.
  /// Retorna o usuário autenticado em caso de sucesso.
  /// Lança uma exceção em caso de erro.
  Future<User> login({
    required String email,
    required String senha,
  }) async {
    try {
      final response = await _apiClient.login(email, senha);

      // Valida se a resposta está no formato esperado
      final data = response.data;
      if (data == null || data is! Map<String, dynamic>) {
        throw Exception('Resposta inválida do servidor.');
      }

      // Pega o token JWT do campo 'access_token'
      final token = data['access_token'];
      if (token == null || token is! String || token.isEmpty) {
        throw Exception('Token JWT não encontrado na resposta.');
      }
      _apiClient.setJwt(token);

      // Pega os dados do usuário do campo 'usuario'
      final userJson = data['usuario'];
      if (userJson == null || userJson is! Map<String, dynamic>) {
        throw Exception('Dados do usuário não encontrados na resposta.');
      }

      // Cria o usuário a partir do JSON
      return User.fromJson(userJson);
    } catch (e) {
      rethrow;
    }
  }

  /// Cria um novo usuário.
  /// Retorna o usuário criado em caso de sucesso.
  Future<User> registrar({
    required String email,
    required String nomeUsuario,
    required String senha,
  }) async {
    try {
      final response = await _apiClient.criarUsuario({
        'email': email,
        'nomeUsuario': nomeUsuario,
        'senha': senha,
      });

      // Supondo que os dados do usuário venham no campo 'usuario'
      final userJson = response.data['usuario'] as Map<String, dynamic>?;
      if (userJson == null) {
        throw Exception('Dados do usuário não encontrados na resposta.');
      }

      return User.fromJson(userJson);
    } catch (e) {
      rethrow;
    }
  }

  /// Permite definir manualmente o token JWT (caso necessário).
  void setJwtToken(String token) {
    _apiClient.setJwt(token);
  }
}

