import 'package:dio/dio.dart';

/// Cliente de API responsável por gerenciar as requisições HTTP.
/// Utiliza o pacote Dio para facilitar as chamadas e o gerenciamento de autenticação JWT.
class ApiClient {
  // Instância estática privada (singleton)
  static final ApiClient _instance = ApiClient._internal();

  /// Instância do Dio utilizada para realizar as requisições.
  late final Dio _dio;

  /// Token JWT utilizado para autenticação nas rotas protegidas.
  String? _jwtToken;

  /// Construtor privado
  // Sim, a porta deve estar na URL se o seu backend estiver rodando em uma porta diferente da padrão (80 para HTTP ou 443 para HTTPS).
  // Por exemplo, se seu backend está rodando localmente na porta 3000, a URL deve ser 'http://localhost:3000'.
  // Se estiver rodando na porta padrão (80 para HTTP), você pode omitir a porta: 'http://localhost'.
  ApiClient._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: 'http://192.168.100.50:3000', // Mantenha a porta se necessário
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));

    // Adiciona um interceptor para inserir o token JWT no header das requisições protegidas.
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Só adiciona o header Authorization se não for um endpoint livre de autenticação.
        if (!_isAuthFreeEndpoint(options.path, method: options.method)) {
          if (_jwtToken != null) {
            options.headers['Authorization'] = 'Bearer $_jwtToken';
          }
        }
        return handler.next(options);
      },
    ));
  }

  /// Fábrica que retorna sempre a mesma instância
  factory ApiClient() {
    return _instance;
  }

  /// Verifica se o endpoint não exige autenticação.
  /// Retorne true para endpoints como login e criação de usuário.
  /// Ajuste conforme os endpoints da sua API.
  bool _isAuthFreeEndpoint(String path, {String method = 'GET'}) {
    // '/login' (ou '/auth') é sempre livre de autenticação.
    // '/usuarios' só é livre de autenticação no método POST (criação de usuário).
    if (path.contains('/auth') || path.contains('/login')) {
      return true;
    }
    if (path.contains('/usuarios') && method.toUpperCase() == 'POST') {
      return true;
    }
    return false;
  }

  /// Salva o token JWT após o login bem-sucedido.
  void setJwtToken(String token) {
    _jwtToken = token;
  }

  // ============================
  // Métodos de exemplo para requisições
  // ============================

  /// Realiza o login do usuário.
  /// [data] deve conter as credenciais necessárias (ex: email e senha).
  Future<Response> login(Map<String, dynamic> data) async {
    return await _dio.post('/auth', data: data);
  }

  /// Cria um novo usuário.
  /// [data] deve conter os dados do novo usuário.
  Future<Response> criarUsuario(Map<String, dynamic> data) async {
    return await _dio.post('/usuarios', data: data);
  }


  //faça uma requisição que busca todas as tarefas do usuário logado
  /// Busca todas as tarefas do usuário logado pelo seu ID.
  /// [userId] é o identificador do usuário.
  Future<Response> buscarTarefasPorUsuario(String userId) async {
    final String url = '${_dio.options.baseUrl}/tasks/$userId';
    return await _dio.get(url);
  }

  /// Realiza uma requisição GET para o [path] informado.
  /// [queryParameters] pode ser utilizado para passar parâmetros de consulta.
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  /// Realiza uma requisição POST para o [path] informado.
  /// [data] pode ser utilizado para enviar o corpo da requisição.
  Future<Response> post(String path, {dynamic data}) async {
    return await _dio.post(path, data: data);
  }

  /// Realiza uma requisição PUT para o [path] informado.
  /// [data] pode ser utilizado para enviar o corpo da requisição.
  Future<Response> put(String path, {dynamic data}) async {
    return await _dio.put(path, data: data);
  }

  /// Realiza uma requisição DELETE para o [path] informado.
  /// [data] pode ser utilizado para enviar o corpo da requisição (caso necessário).
  Future<Response> delete(String path, {dynamic data}) async {
    return await _dio.delete(path, data: data);
  }
}
