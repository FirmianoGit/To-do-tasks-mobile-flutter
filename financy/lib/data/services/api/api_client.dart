import 'package:dio/dio.dart';
import 'package:financy_app/core/exceptions/exceptions.dart';

class ApiClient {
  // Instância estática privada (singleton)
  static final ApiClient _instance = ApiClient._internal();

  /// Instância do Dio utilizada para realizar as requisições.
  late final Dio _dio;

  /// Token JWT utilizado para autenticação nas rotas protegidas.
  String? _jwtToken;

  /// Construtor privado
  ApiClient._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: 'http://192.168.100.50:3000', //'http://10.0.1.64:3000',// // Mantenha a porta se necessário
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
    try {
      final response = await postRequisicao('/auth', dados: {'email': email, 'senha': senha});
      return response;
    } on DioException catch (e) {
      final mensagem = e.response?.data?['message']?.toString() ?? e.message ?? 'Erro desconhecido ao fazer login.';
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException('Não autorizado: $mensagem');
      } else if (e.response?.statusCode == 500) {
        throw ErroServidorException('Erro interno do servidor: $mensagem');
      } else if (e.response?.statusCode == 400) {
        throw ErroDesconhecidoException('Requisição inválida: $mensagem');
      }
      throw ErroDesconhecidoException('Erro inesperado ao fazer login: $mensagem');
    }
  }

  /// Requisição GET genérica.
  Future<Response> getRequisicao(String caminho, {Map<String, dynamic>? parametrosConsulta}) async {
    try {
      return await _dio.get(caminho, queryParameters: parametrosConsulta);
    } on DioException catch (e) {
      final mensagem = e.response?.data?['message']?.toString() ?? e.message ?? 'Erro desconhecido na requisição GET.';
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException('Não autorizado: $mensagem');
      } else if (e.response?.statusCode == 500) {
        throw ErroServidorException('Erro interno do servidor: $mensagem');
      } else if (e.response?.statusCode == 400) {
        throw ErroDesconhecidoException('Requisição inválida: $mensagem');
      }
      throw ErroDesconhecidoException('Erro inesperado na requisição GET: $mensagem');
    }
  }

  /// Requisição POST genérica.
  Future<Response> postRequisicao(String caminho, {dynamic dados}) async {
    try {
      return await _dio.post(caminho, data: dados);
    } on DioException catch (e) {
      final mensagem = e.response?.data?['message']?.toString() ?? e.message ?? 'Erro desconhecido na requisição POST.';
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException('Não autorizado: $mensagem');
      } else if (e.response?.statusCode == 409) {
        throw ErroEmailRegistradoException('E-mail ou nome de usuário já cadastrados: $mensagem');
      } else if (e.response?.statusCode == 500) {
        throw ErroServidorException('Erro interno do servidor: $mensagem');
      } else if (e.response?.statusCode == 400) {
        throw ErroDesconhecidoException('Requisição inválida: $mensagem');
      }
      throw ErroDesconhecidoException('Erro inesperado na requisição POST: $mensagem');
    }
  }

  /// Requisição PUT genérica.
  Future<Response> putRequisicao(String caminho, {dynamic dados}) async {
    try {
      return await _dio.put(caminho, data: dados);
    } on DioException catch (e) {
      final mensagem = e.response?.data?['message']?.toString() ?? e.message ?? 'Erro desconhecido na requisição PUT.';
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException('Não autorizado: $mensagem');
      } else if (e.response?.statusCode == 500) {
        throw ErroServidorException('Erro interno do servidor: $mensagem');
      } else if (e.response?.statusCode == 400) {
        throw ErroDesconhecidoException('Requisição inválida: $mensagem');
      }
      throw ErroDesconhecidoException('Erro inesperado na requisição PUT: $mensagem');
    }
  }

  /// Requisição DELETE genérica.
  Future<Response> deleteRequisicao(String caminho, {dynamic dados}) async {
    try {
      return await _dio.delete(caminho, data: dados);
    } on DioException catch (e) {
      final mensagem = e.response?.data?['message']?.toString() ?? e.message ?? 'Erro desconhecido na requisição DELETE.';
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException('Não autorizado: $mensagem');
      } else if (e.response?.statusCode == 500) {
        throw ErroServidorException('Erro interno do servidor: $mensagem');
      } else if (e.response?.statusCode == 400) {
        throw ErroDesconhecidoException('Requisição inválida: $mensagem');
      }
      throw ErroDesconhecidoException('Erro inesperado na requisição DELETE: $mensagem');
    }
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
    try {
      return await postRequisicao('/users', dados: dadosUsuario);
    } on ErroEmailRegistradoException catch (e) {
      // Se for ErroEmailRegistradoException, apenas relança
      rethrow;
    } on DioException catch (e) {
      final mensagem = e.response?.data?['message']?.toString() ?? e.message ?? 'Erro desconhecido ao criar usuário.';
      if (e.response?.statusCode == 500) {
        throw ErroServidorException('Erro ao criar usuário: $mensagem');
      }
      throw ErroDesconhecidoException('Erro ao criar usuário: $mensagem');
    } catch (e) {
      throw ErroDesconhecidoException('Erro inesperado ao criar usuário: $e');
    }
  }
}
