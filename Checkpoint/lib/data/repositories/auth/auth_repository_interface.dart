// lib/domain/repositories/auth_repository_interface.dart

import 'package:financy_app/domain/models/users/users.dart';
import 'package:flutter/material.dart';

abstract class IAuthRepository extends ChangeNotifier {
  Future<User> login({
    required String email,
    required String senha,
  });

  Future<User> registrar({
    required String email,
    required String nomeUsuario,
    required String senha,
  });

  Future<User?> restaurarSessao();

  void setJwtToken(String token);

  Future<void> logout(); // você pode adicionar aqui também
}