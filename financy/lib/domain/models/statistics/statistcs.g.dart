// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistcs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Estatistics _$EstatisticsFromJson(Map<String, dynamic> json) => _Estatistics(
      totalTarefas: (json['totalTarefas'] as num).toInt(),
      tarefasConcluidas: (json['tarefasConcluidas'] as num).toInt(),
      taxaConclusao: (json['taxaConclusao'] as num).toDouble(),
      mediaPrioridade: (json['mediaPrioridade'] as num).toDouble(),
      distribuicaoPrioridades: (json['distribuicaoPrioridades']
              as List<dynamic>)
          .map(
              (e) => DistribuicaoPrioridade.fromJson(e as Map<String, dynamic>))
          .toList(),
      tarefasUltimos30Dias: (json['tarefasUltimos30Dias'] as num).toInt(),
      tarefasPorDiaSemana: (json['tarefasPorDiaSemana'] as List<dynamic>)
          .map((e) => TarefasPorDiaSemana.fromJson(e as Map<String, dynamic>))
          .toList(),
      tarefasPorHora: (json['tarefasPorHora'] as List<dynamic>)
          .map((e) => TarefasPorHora.fromJson(e as Map<String, dynamic>))
          .toList(),
      tarefasPorSemana: (json['tarefasPorSemana'] as List<dynamic>)
          .map((e) => TarefasPorSemana.fromJson(e as Map<String, dynamic>))
          .toList(),
      crescimento: (json['crescimento'] as num).toDouble(),
      periodoAtual: (json['periodoAtual'] as num).toDouble(),
      periodoAnterior: (json['periodoAnterior'] as num).toDouble(),
      mediasTempoPorPrioridade:
          (json['mediasTempoPorPrioridade'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      tarefasPorPrioridade:
          Map<String, int>.from(json['tarefasPorPrioridade'] as Map),
      tarefasComRiscoDeAtraso: (json['tarefasComRiscoDeAtraso']
              as List<dynamic>)
          .map(
              (e) => TarefaComRiscoDeAtraso.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalTarefasAnalisadas: (json['totalTarefasAnalisadas'] as num).toInt(),
    );

Map<String, dynamic> _$EstatisticsToJson(_Estatistics instance) =>
    <String, dynamic>{
      'totalTarefas': instance.totalTarefas,
      'tarefasConcluidas': instance.tarefasConcluidas,
      'taxaConclusao': instance.taxaConclusao,
      'mediaPrioridade': instance.mediaPrioridade,
      'distribuicaoPrioridades': instance.distribuicaoPrioridades,
      'tarefasUltimos30Dias': instance.tarefasUltimos30Dias,
      'tarefasPorDiaSemana': instance.tarefasPorDiaSemana,
      'tarefasPorHora': instance.tarefasPorHora,
      'tarefasPorSemana': instance.tarefasPorSemana,
      'crescimento': instance.crescimento,
      'periodoAtual': instance.periodoAtual,
      'periodoAnterior': instance.periodoAnterior,
      'mediasTempoPorPrioridade': instance.mediasTempoPorPrioridade,
      'tarefasPorPrioridade': instance.tarefasPorPrioridade,
      'tarefasComRiscoDeAtraso': instance.tarefasComRiscoDeAtraso,
      'totalTarefasAnalisadas': instance.totalTarefasAnalisadas,
    };

_DistribuicaoPrioridade _$DistribuicaoPrioridadeFromJson(
        Map<String, dynamic> json) =>
    _DistribuicaoPrioridade(
      prioridade: (json['prioridade'] as num).toInt(),
      quantidade: (json['quantidade'] as num).toInt(),
    );

Map<String, dynamic> _$DistribuicaoPrioridadeToJson(
        _DistribuicaoPrioridade instance) =>
    <String, dynamic>{
      'prioridade': instance.prioridade,
      'quantidade': instance.quantidade,
    };

_TarefasPorDiaSemana _$TarefasPorDiaSemanaFromJson(Map<String, dynamic> json) =>
    _TarefasPorDiaSemana(
      diaSemana: (json['diaSemana'] as num).toInt(),
      quantidade: (json['quantidade'] as num).toInt(),
    );

Map<String, dynamic> _$TarefasPorDiaSemanaToJson(
        _TarefasPorDiaSemana instance) =>
    <String, dynamic>{
      'diaSemana': instance.diaSemana,
      'quantidade': instance.quantidade,
    };

_TarefasPorHora _$TarefasPorHoraFromJson(Map<String, dynamic> json) =>
    _TarefasPorHora(
      hora: (json['hora'] as num).toInt(),
      quantidade: (json['quantidade'] as num).toInt(),
    );

Map<String, dynamic> _$TarefasPorHoraToJson(_TarefasPorHora instance) =>
    <String, dynamic>{
      'hora': instance.hora,
      'quantidade': instance.quantidade,
    };

_TarefasPorSemana _$TarefasPorSemanaFromJson(Map<String, dynamic> json) =>
    _TarefasPorSemana(
      semana: (json['semana'] as num).toInt(),
      quantidade: (json['quantidade'] as num).toInt(),
    );

Map<String, dynamic> _$TarefasPorSemanaToJson(_TarefasPorSemana instance) =>
    <String, dynamic>{
      'semana': instance.semana,
      'quantidade': instance.quantidade,
    };

_TarefaComRiscoDeAtraso _$TarefaComRiscoDeAtrasoFromJson(
        Map<String, dynamic> json) =>
    _TarefaComRiscoDeAtraso(
      taskId: (json['taskId'] as num).toInt(),
      titulo: json['titulo'] as String,
      prioridade: (json['prioridade'] as num).toInt(),
      tempoDecorrido: (json['tempoDecorrido'] as num).toDouble(),
      tempoMedioEsperado: (json['tempoMedioEsperado'] as num).toDouble(),
      risco: json['risco'] as bool,
    );

Map<String, dynamic> _$TarefaComRiscoDeAtrasoToJson(
        _TarefaComRiscoDeAtraso instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'titulo': instance.titulo,
      'prioridade': instance.prioridade,
      'tempoDecorrido': instance.tempoDecorrido,
      'tempoMedioEsperado': instance.tempoMedioEsperado,
      'risco': instance.risco,
    };
