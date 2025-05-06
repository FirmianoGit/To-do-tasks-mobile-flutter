import 'package:freezed_annotation/freezed_annotation.dart';

part 'tasks.freezed.dart'; // mesmo prefixo do nome do arquivo
part 'tasks.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required int taskId,
    required String titulo,
    required String descricao,
    required int statusId,
    required int usuarioId,
    required DateTime criadoEm,
    required int prioridade,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
