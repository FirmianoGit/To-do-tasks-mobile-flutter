import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:financy_app/domain/models/users/users.dart';

class LocalStorage {
  // Chave para armazenar o token JWT
  static const _jwtKey = 'jwt_token';
  // Chave para armazenar os dados do usuário
  static const _userKey = 'user_data';
  // Chave para verificar se é a primeira abertura do app
  static const String _keyFirstOpen = 'first_open';

  // Salva o token JWT no armazenamento local
  static Future<void> salvarJwt(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final sucesso = await prefs.setString(_jwtKey, token);
      if (!sucesso) {
        throw Exception('Falha ao salvar o token JWT.');
      }
    } catch (e, stack) {
      print('Erro ao salvar JWT: $e\n$stack');
      throw Exception('Erro ao salvar o token JWT localmente.');
    }
  }

  // Obtém o token JWT armazenado localmente
  static Future<String?> obterJwt() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_jwtKey);
    } catch (e, stack) {
      print('Erro ao obter JWT: $e\n$stack');
      return null;
    }
  }

  // Remove o token JWT do armazenamento local
  static Future<void> removerJwt() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_jwtKey);
    } catch (e, stack) {
      print('Erro ao remover JWT: $e\n$stack');
      // Remoção falha silenciosamente
    }
  }

  // Salva os dados do usuário localmente em formato JSON
  static Future<void> salvarUsuario(User user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = jsonEncode(user.toJson());
      final sucesso = await prefs.setString(_userKey, jsonString);
      if (!sucesso) {
        throw Exception('Falha ao salvar os dados do usuário.');
      }
    } catch (e, stack) {
      print('Erro ao salvar usuário localmente: $e\n$stack');
      throw Exception('Erro ao salvar dados do usuário localmente.');
    }
  }

  // Obtém os dados do usuário armazenados localmente
  static Future<User?> obterUsuario() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_userKey);
      if (jsonString == null) return null;

      final jsonMap = jsonDecode(jsonString);
      if (jsonMap is! Map<String, dynamic>) {
        throw Exception('Formato inválido para os dados do usuário.');
      }

      return User.fromJson(jsonMap);
    } on FormatException catch (e) {
      print('Erro de formatação ao decodificar o usuário: $e');
      return null; // Dados inválidos são ignorados
    } catch (e, stack) {
      print('Erro ao obter usuário localmente: $e\n$stack');
      return null;
    }
  }

  // Remove os dados do usuário armazenados localmente
  static Future<void> removerUsuario() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_userKey);
    } catch (e, stack) {
      print('Erro ao remover dados do usuário: $e\n$stack');
    }
  }

  // Verifica se é a primeira vez que o app está sendo aberto
  static Future<bool> isFirstOpen() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_keyFirstOpen) ?? true;
    } catch (e, stack) {
      print('Erro ao verificar first_open: $e\n$stack');
      return true;
    }
  }

  // Define se é a primeira abertura do app
  static Future<void> setFirstOpen(bool value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_keyFirstOpen, value);
    } catch (e, stack) {
      print('Erro ao definir first_open: $e\n$stack');
    }
  }
}
