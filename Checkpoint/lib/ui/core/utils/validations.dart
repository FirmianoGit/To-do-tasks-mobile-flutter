/// Arquivo contendo funções de validação reutilizáveis para formulários
class Validations {
  /// Valida se o email está em formato válido
  /// 
  /// Retorna uma mensagem de erro se inválido, ou null se válido
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu e-mail';
    }
    
    // Regex mais robusto para validação de email
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    
    if (!emailRegex.hasMatch(value)) {
      return 'E-mail inválido';
    }
    
    return null;
  }

  /// Valida se a senha atende aos critérios de segurança
  /// 
  /// Critérios:
  /// - Mínimo 8 caracteres
  /// - Pelo menos 1 letra maiúscula
  /// - Pelo menos 1 número
  /// - Pelo menos 1 caractere especial
  /// 
  /// Retorna uma mensagem de erro se inválida, ou null se válida
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira sua senha';
    }
    
    if (value.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres';
    }
    
    // Verifica se tem pelo menos 1 letra maiúscula
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'A senha deve conter pelo menos 1 letra maiúscula';
    }
    
    // Verifica se tem pelo menos 1 número
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'A senha deve conter pelo menos 1 número';
    }
    
    // Verifica se tem pelo menos 1 caractere especial
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'A senha deve conter pelo menos 1 caractere especial (!@#\$%^&*(),.?":{}|<>)';
    }
    
    return null;
  }

  /// Valida se a senha de confirmação coincide com a senha principal
  /// 
  /// Retorna uma mensagem de erro se não coincidir, ou null se coincidir
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Por favor, confirme sua senha';
    }
    
    if (value != password) {
      return 'As senhas não coincidem';
    }
    
    return null;
  }

  /// Valida se o campo não está vazio
  /// 
  /// Retorna uma mensagem de erro se vazio, ou null se preenchido
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor, insira seu $fieldName';
    }
    
    return null;
  }

  /// Valida se o nome de usuário atende aos critérios
  /// 
  /// Critérios:
  /// - Mínimo 3 caracteres
  /// - Máximo 20 caracteres
  /// - Apenas letras, números e underscore
  /// 
  /// Retorna uma mensagem de erro se inválido, ou null se válido
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu nome de usuário';
    }
    
    if (value.length < 3) {
      return 'O nome de usuário deve ter pelo menos 3 caracteres';
    }
    
    if (value.length > 20) {
      return 'O nome de usuário deve ter no máximo 20 caracteres';
    }
    
    // Verifica se contém apenas caracteres válidos
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return 'O nome de usuário deve conter apenas letras, números e underscore';
    }
    
    return null;
  }
}
