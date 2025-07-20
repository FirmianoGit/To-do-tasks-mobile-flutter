// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      nomeUsuario: json['nomeUsuario'] as String,
      senha: json['senha'] as String,
      tarefas: (json['tarefas'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'nomeUsuario': instance.nomeUsuario,
      'senha': instance.senha,
      'tarefas': instance.tarefas,
    };
