import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistcs.freezed.dart';
part 'statistcs.g.dart';

@freezed
abstract class Estatistics with _$Estatistics {
  const factory Estatistics({
    // Estatísticas de produtividade
    required int totalTarefas,
    required int tarefasConcluidas,
    required double taxaConclusao,
    required double mediaPrioridade,
    required List<DistribuicaoPrioridade> distribuicaoPrioridades,
    required int tarefasUltimos30Dias,

    // Estatísticas temporais
    required List<TarefasPorDiaSemana> tarefasPorDiaSemana,
    required List<TarefasPorHora> tarefasPorHora,
    required List<TarefasPorSemana> tarefasPorSemana,
    required double crescimento,
    required double periodoAtual,
    required double periodoAnterior,

    // Estatísticas preditivas
    required Map<String, double> mediasTempoPorPrioridade,
    required Map<String, int> tarefasPorPrioridade,
    required List<TarefaComRiscoDeAtraso> tarefasComRiscoDeAtraso,
    required int totalTarefasAnalisadas,
  }) = _Estatistics;

  factory Estatistics.fromJson(Map<String, dynamic> json) => _$EstatisticsFromJson(json);
}

@freezed
abstract class DistribuicaoPrioridade with _$DistribuicaoPrioridade {
  const factory DistribuicaoPrioridade({
    required int prioridade,
    required int quantidade,
  }) = _DistribuicaoPrioridade;

  factory DistribuicaoPrioridade.fromJson(Map<String, dynamic> json) => _$DistribuicaoPrioridadeFromJson(json);
}

@freezed
abstract class TarefasPorDiaSemana with _$TarefasPorDiaSemana {
  const factory TarefasPorDiaSemana({
    required int diaSemana,
    required int quantidade,
  }) = _TarefasPorDiaSemana;

  factory TarefasPorDiaSemana.fromJson(Map<String, dynamic> json) => _$TarefasPorDiaSemanaFromJson(json);
}

@freezed
abstract class TarefasPorHora with _$TarefasPorHora {
  const factory TarefasPorHora({
    required int hora,
    required int quantidade,
  }) = _TarefasPorHora;

  factory TarefasPorHora.fromJson(Map<String, dynamic> json) => _$TarefasPorHoraFromJson(json);
}

@freezed
abstract class TarefasPorSemana with _$TarefasPorSemana {
  const factory TarefasPorSemana({
    required int semana,
    required int quantidade,
  }) = _TarefasPorSemana;

  factory TarefasPorSemana.fromJson(Map<String, dynamic> json) => _$TarefasPorSemanaFromJson(json);
}

@freezed
abstract class TarefaComRiscoDeAtraso with _$TarefaComRiscoDeAtraso {
  const factory TarefaComRiscoDeAtraso({
    required int taskId,
    required String titulo,
    required int prioridade,
    required double tempoDecorrido,
    required double tempoMedioEsperado,
    required bool risco,
  }) = _TarefaComRiscoDeAtraso;

  factory TarefaComRiscoDeAtraso.fromJson(Map<String, dynamic> json) => _$TarefaComRiscoDeAtrasoFromJson(json);
}