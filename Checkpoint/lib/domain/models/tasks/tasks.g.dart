// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
      taskId: (json['taskId'] as num).toInt(),
      titulo: json['titulo'] as String,
      descricao: json['descricao'] as String,
      statusId: (json['statusId'] as num).toInt(),
      usuarioId: (json['usuarioId'] as num).toInt(),
      criadoEm: DateTime.parse(json['criadoEm'] as String),
      prioridade: (json['prioridade'] as num).toInt(),
    );

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
      'taskId': instance.taskId,
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'statusId': instance.statusId,
      'usuarioId': instance.usuarioId,
      'criadoEm': instance.criadoEm.toIso8601String(),
      'prioridade': instance.prioridade,
    };
