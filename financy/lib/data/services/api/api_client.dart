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
    if (path.contains('/auth')) {
      return true;
    }
    if (path.contains('/users') && method.toUpperCase() == 'POST') {
      return true;
    }
    return false;
  }

  /// Define o token JWT para autenticação nas requisições.
  void setJwt(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  /// Realiza o login do usuário.
  Future<Response> login(String email, String senha) async {
    return await postRequisicao('/auth', dados: {'email': email, 'senha': senha});
  }

  /// Requisição GET genérica.
  Future<Response> getRequisicao(String caminho, {Map<String, dynamic>? parametrosConsulta}) async {
    return await _dio.get(caminho, queryParameters: parametrosConsulta);
  }

  /// Requisição POST genérica.
  Future<Response> postRequisicao(String caminho, {dynamic dados}) async {
    return await _dio.post(caminho, data: dados);
  }

  /// Requisição PUT genérica.
  Future<Response> putRequisicao(String caminho, {dynamic dados}) async {
    return await _dio.put(caminho, data: dados);
  }

  /// Requisição DELETE genérica.
  Future<Response> deleteRequisicao(String caminho, {dynamic dados}) async {
    return await _dio.delete(caminho, data: dados);
  }

  /// Criação de tarefa. Retorna a tarefa criada.
  Future<Response> criarTarefa(Map<String, dynamic> dadosTarefa) async {
    return await postRequisicao('/tasks', dados: dadosTarefa);
  }

  /// Listagem paginada de tarefas do usuário autenticado. Retorna lista e total.
  Future<Response> listarTarefas({int pagina = 1, int limite = 10}) async {
    return await getRequisicao('/tasks', parametrosConsulta: {
      'page': pagina,
      'limit': limite,
    });
  }

  /// Busca tarefa por ID.
  Future<Response> buscarTarefaPorId(int id) async {
    return await getRequisicao('/tasks/ $id');
  }

  /// Atualização de tarefa por ID. Retorna a tarefa atualizada.
  Future<Response> atualizarTarefa(int id, Map<String, dynamic> dadosAtualizados) async {
    return await putRequisicao('/tasks/ $id', dados: dadosAtualizados);
  }

  /// Remoção de tarefa por ID. Retorna confirmação.
  Future<Response> removerTarefa(int id) async {
    return await deleteRequisicao('/tasks/ $id');
  }

  /// Criação de usuário. Retorna o usuário criado.
  Future<Response> criarUsuario(Map<String, dynamic> dadosUsuario) async {
    return await postRequisicao('/users', dados: dadosUsuario);
  }
}
