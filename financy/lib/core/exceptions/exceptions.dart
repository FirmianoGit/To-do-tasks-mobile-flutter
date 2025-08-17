class UnauthorizedException implements Exception {
  final String mensagem;
  UnauthorizedException([this.mensagem = 'Usuário não autorizado.']);

  @override
  String toString() => 'UnauthorizedException: $mensagem';
}

class ErroServidorException implements Exception {
  final String mensagem;
  ErroServidorException([this.mensagem = 'Erro interno do servidor.']);

  @override
  String toString() => 'ErroServidorException: $mensagem';
}

class ErroDesconhecidoException implements Exception {
  final String mensagem;
  ErroDesconhecidoException([this.mensagem = 'Erro desconhecido.']);

  @override
  String toString() => 'ErroDesconhecidoException: $mensagem';
}

class ErroJWTException implements Exception {
  final String mensagem;
  ErroJWTException([this.mensagem = 'Token JWT inválido ou ausente.']);

  @override
  String toString() => 'ErroJWTException: $mensagem';
}

class ErroEmailRegistradoException implements Exception {
  final String mensagem;
  ErroEmailRegistradoException([this.mensagem = 'E-mail já registrado.']);

  @override
  String toString() => 'ErroEmailRegistradoException: $mensagem';
}
