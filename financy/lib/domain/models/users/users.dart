import 'package:freezed_annotation/freezed_annotation.dart';
import '../tasks/tasks.dart';

part 'users.freezed.dart';
part 'users.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required int id,
    required String email,
    required String nomeUsuario,
    required String senha,
    required List<Task> tarefas,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
