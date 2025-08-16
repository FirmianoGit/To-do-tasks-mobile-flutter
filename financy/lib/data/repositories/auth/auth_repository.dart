import 'package:financy_app/core/exceptions/exceptions.dart';
import 'package:financy_app/data/repositories/auth/auth_repository_interface.dart';
import 'package:financy_app/data/services/api/api_client.dart';
import 'package:financy_app/data/services/local/local_storage.dart';
import 'package:financy_app/domain/models/users/users.dart';

/// Repositório responsável por isolar a lógica de autenticação da camada de dados.
/// Mantém o estado do usuário logado e se está logado, acessível globalmente.
class AuthRepository extends IAuthRepository {
  final ApiClient _apiClient;

  User? _usuarioLogado;
  bool _estaLogado = false;

  /// Getter para acessar o usuário atualmente logado.
  User? get usuarioLogado => _usuarioLogado;

  /// Getter para saber se há um usuário logado.
  bool get estaLogado => _estaLogado;

  // Permite injetar um ApiClient customizado (ex: para testes).
  // Caso não seja fornecido, instancia um por padrão.
  AuthRepository({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  /// Realiza o processo completo de login, incluindo:
  /// - Autenticação na API
  /// - Armazenamento do token JWT
  /// - Definição do token para próximas requisições
  /// - Conversão da resposta em um objeto User
  /// - Atualização do estado de usuário logado
  @override
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
        throw ErroJWTException();
      }

      // Armazena o token localmente para persistência entre sessões
      try {
        await LocalStorage.salvarJwt(token);
      } on Exception catch (e) {
        throw Exception(
            'Erro ao salvar o token JWT localmente: ${e.toString()}');
      } catch (e, stack) {
        print('Erro inesperado ao salvar o token JWT: $e\n$stack');
        throw ErroJWTException();
      }

      // Define o token no client para autenticar as próximas chamadas automaticamente
      try {
        _apiClient.setJwt(token);
      } on Exception catch (e) {
        throw Exception(
            'Erro ao definir o token JWT no ApiClient: ${e.toString()}');
      } catch (e, stack) {
        print(
            'Erro inesperado ao definir o token JWT no ApiClient: $e\n$stack');
        throw ErroJWTException();
      }

      // Recupera os dados do usuário autenticado a partir da resposta
      final userJson = data['usuario'];
      if (userJson == null || userJson is! Map<String, dynamic>) {
        throw ErroServidorException();
      }

      // Converte o JSON em um modelo User
      final user = User.fromJson(userJson);

      // Atualiza o estado interno de usuário logado
      _usuarioLogado = user;
      _estaLogado = true;
      notifyListeners();

      // Salva o usuário localmente para restauração de sessão futura
      try {
        await LocalStorage.salvarUsuario(user);
      } catch (e, stack) {
        print('Erro ao salvar usuário localmente: $e\n$stack');
        // Não lança exceção, pois o login foi bem-sucedido, mas loga o erro
      }

      return user;
    } catch (e) {
      // Garante que o estado seja limpo em caso de erro
      _usuarioLogado = null;
      _estaLogado = false;
      notifyListeners();
      rethrow;
    }
  }

  /// Envia os dados do novo usuário para o backend e retorna o modelo User criado.
  @override
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
      rethrow;
    }
  }

  /// Tenta restaurar a sessão do usuário a partir dos dados armazenados localmente.
  /// Define o token no ApiClient e retorna o User se for bem-sucedido.
  /// Caso os dados estejam corrompidos, inválidos ou incompletos, remove tudo e retorna null.
  /// Atualiza o estado interno de usuário logado.
  @override
  Future<User?> restaurarSessao() async {
    try {
      final token = await LocalStorage.obterJwt();
      if (token == null || token.isEmpty) {
        print(
            '[AuthRepository] Token JWT ausente ou inválido na restauração de sessão.');
        await LocalStorage.removerJwt();
        await LocalStorage.removerUsuario();
        _usuarioLogado = null;
        _estaLogado = false;
        notifyListeners();
        return null;
      }

      final user = await LocalStorage.obterUsuario();
      if (user == null) {
        print(
            '[AuthRepository] Dados do usuário ausentes ou inválidos na restauração de sessão.');
        await LocalStorage.removerJwt();
        await LocalStorage.removerUsuario();
        _usuarioLogado = null;
        _estaLogado = false;
        notifyListeners();
        return null;
      }

      try {
        _apiClient.setJwt(token); // Seta o token para uso futuro
      } catch (e, stack) {
        print(
            '[AuthRepository] Erro ao definir o token JWT no ApiClient: $e\n$stack');
        await LocalStorage.removerJwt();
        await LocalStorage.removerUsuario();
        _usuarioLogado = null;
        _estaLogado = false;
        notifyListeners();
        return null;
      }

      _usuarioLogado = user;
      _estaLogado = true;
      notifyListeners();
      return user;
    } on FormatException catch (e, stack) {
      print(
          '[AuthRepository] Erro de formatação ao restaurar sessão: $e\n$stack');
      await LocalStorage.removerJwt();
      await LocalStorage.removerUsuario();
      _usuarioLogado = null;
      _estaLogado = false;
      notifyListeners();
      return null;
    } on Exception catch (e, stack) {
      print('[AuthRepository] Erro conhecido ao restaurar sessão: $e\n$stack');
      await LocalStorage.removerJwt();
      await LocalStorage.removerUsuario();
      _usuarioLogado = null;
      _estaLogado = false;
      notifyListeners();
      return null;
    } catch (e, stack) {
      print('[AuthRepository] Erro inesperado ao restaurar sessão: $e\n$stack');
      await LocalStorage.removerJwt();
      await LocalStorage.removerUsuario();
      _usuarioLogado = null;
      _estaLogado = false;
      notifyListeners();
      return null;
    }
  }

  /// Permite injetar um token manualmente (por exemplo, em uma sessão restaurada).
  /// Também tenta restaurar o usuário associado ao token, se possível.
  @override
  void setJwtToken(String token) {
    _apiClient.setJwt(token);
    // Não altera o estado do usuário logado diretamente aqui,
    // pois depende de restauração de sessão.
  }

  /// Permite que seja feito o Logout da aplicação.
  /// Limpa o estado de usuário logado e notifica listeners.
  @override
  Future<void> logout() async {
    await LocalStorage.removerJwt();
    await LocalStorage.removerUsuario();
    _usuarioLogado = null;
    _estaLogado = false;
    notifyListeners();
  }
}
