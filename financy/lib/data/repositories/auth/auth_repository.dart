import 'package:financy_app/data/services/api/api_client.dart';
import 'package:financy_app/data/services/local/local_storage.dart';
import 'package:financy_app/domain/models/users/users.dart';

/// Repositório responsável por isolar a lógica de autenticação da camada de dados.
class AuthRepository {
  final ApiClient _apiClient;

  // Permite injetar um ApiClient customizado (ex: para testes). 
  // Caso não seja fornecido, instancia um por padrão.
  AuthRepository({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  /// Realiza o processo completo de login, incluindo:
  /// - Autenticação na API
  /// - Armazenamento do token JWT
  /// - Definição do token para próximas requisições
  /// - Conversão da resposta em um objeto User
  Future<User> login({
    required String email,
    required String senha,
  }) async {
    try {
      // Envia as credenciais para o endpoint de login
      final response = await _apiClient.login(email, senha);

      // Verifica se a resposta contém dados válidos
      final data = response.data;
      if (data == null || data is! Map<String, dynamic>) {
        throw Exception('Resposta inválida do servidor.');
      }

      // Extrai o token JWT retornado
      final token = data['access_token'];
      if (token == null || token is! String || token.isEmpty) {
        throw Exception('Token JWT não encontrado na resposta.');
      }

      // Armazena o token localmente para persistência entre sessões
      try {
        await JwtStorage.salvarJwt(token);
      } on Exception catch (e) {
        // Tratamento específico para falhas comuns de persistência
        throw Exception('Erro ao salvar o token JWT localmente: ${e.toString()}');
      } catch (e, stack) {
        // Tratamento genérico com log de stack trace para debug
        print('Erro inesperado ao salvar o token JWT: $e\n$stack');
        throw Exception('Erro inesperado ao salvar o token JWT.');
      }

      // Define o token no client para autenticar as próximas chamadas automaticamente
      try {
        _apiClient.setJwt(token);
      } on Exception catch (e) {
        throw Exception('Erro ao definir o token JWT no ApiClient: ${e.toString()}');
      } catch (e, stack) {
        print('Erro inesperado ao definir o token JWT no ApiClient: $e\n$stack');
        throw Exception('Erro inesperado ao definir o token JWT no ApiClient.');
      }

      // Recupera os dados do usuário autenticado a partir da resposta
      final userJson = data['usuario'];
      if (userJson == null || userJson is! Map<String, dynamic>) {
        throw Exception('Dados do usuário não encontrados na resposta.');
      }

      // Converte o JSON em um modelo User
      return User.fromJson(userJson);
    } catch (e) {
      // Propaga qualquer exceção para ser tratada pela camada superior
      rethrow;
    }
  }

  /// Envia os dados do novo usuário para o backend e retorna o modelo User criado.
  Future<User> registrar({
    required String email,
    required String nomeUsuario,
    required String senha,
  }) async {
    try {
      // Envia os dados para o endpoint de registro
      final response = await _apiClient.criarUsuario({
        'email': email,
        'nomeUsuario': nomeUsuario,
        'senha': senha,
      });

      // Espera que a resposta contenha os dados do usuário criado
      final userJson = response.data['usuario'] as Map<String, dynamic>?;
      if (userJson == null) {
        throw Exception('Dados do usuário não encontrados na resposta.');
      }

      // Converte o JSON em um modelo User
      return User.fromJson(userJson);
    } catch (e) {
      // Propaga erros para que a interface decida como lidar
      rethrow;
    }
  }

  /// Permite injetar um token manualmente (por exemplo, em uma sessão restaurada).
  void setJwtToken(String token) {
    _apiClient.setJwt(token);
  }
}
