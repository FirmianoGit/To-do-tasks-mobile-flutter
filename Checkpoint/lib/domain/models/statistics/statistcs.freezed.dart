// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistcs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Estatistics {
// Estatísticas de produtividade
  int get totalTarefas;
  int get tarefasConcluidas;
  double get taxaConclusao;
  double get mediaPrioridade;
  List<DistribuicaoPrioridade> get distribuicaoPrioridades;
  int get tarefasUltimos30Dias; // Estatísticas temporais
  List<TarefasPorDiaSemana> get tarefasPorDiaSemana;
  List<TarefasPorHora> get tarefasPorHora;
  List<TarefasPorSemana> get tarefasPorSemana;
  double get crescimento;
  double get periodoAtual;
  double get periodoAnterior; // Estatísticas preditivas
  Map<String, double> get mediasTempoPorPrioridade;
  Map<String, int> get tarefasPorPrioridade;
  List<TarefaComRiscoDeAtraso> get tarefasComRiscoDeAtraso;
  int get totalTarefasAnalisadas;

  /// Create a copy of Estatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EstatisticsCopyWith<Estatistics> get copyWith =>
      _$EstatisticsCopyWithImpl<Estatistics>(this as Estatistics, _$identity);

  /// Serializes this Estatistics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Estatistics &&
            (identical(other.totalTarefas, totalTarefas) ||
                other.totalTarefas == totalTarefas) &&
            (identical(other.tarefasConcluidas, tarefasConcluidas) ||
                other.tarefasConcluidas == tarefasConcluidas) &&
            (identical(other.taxaConclusao, taxaConclusao) ||
                other.taxaConclusao == taxaConclusao) &&
            (identical(other.mediaPrioridade, mediaPrioridade) ||
                other.mediaPrioridade == mediaPrioridade) &&
            const DeepCollectionEquality().equals(
                other.distribuicaoPrioridades, distribuicaoPrioridades) &&
            (identical(other.tarefasUltimos30Dias, tarefasUltimos30Dias) ||
                other.tarefasUltimos30Dias == tarefasUltimos30Dias) &&
            const DeepCollectionEquality()
                .equals(other.tarefasPorDiaSemana, tarefasPorDiaSemana) &&
            const DeepCollectionEquality()
                .equals(other.tarefasPorHora, tarefasPorHora) &&
            const DeepCollectionEquality()
                .equals(other.tarefasPorSemana, tarefasPorSemana) &&
            (identical(other.crescimento, crescimento) ||
                other.crescimento == crescimento) &&
            (identical(other.periodoAtual, periodoAtual) ||
                other.periodoAtual == periodoAtual) &&
            (identical(other.periodoAnterior, periodoAnterior) ||
                other.periodoAnterior == periodoAnterior) &&
            const DeepCollectionEquality().equals(
                other.mediasTempoPorPrioridade, mediasTempoPorPrioridade) &&
            const DeepCollectionEquality()
                .equals(other.tarefasPorPrioridade, tarefasPorPrioridade) &&
            const DeepCollectionEquality().equals(
                other.tarefasComRiscoDeAtraso, tarefasComRiscoDeAtraso) &&
            (identical(other.totalTarefasAnalisadas, totalTarefasAnalisadas) ||
                other.totalTarefasAnalisadas == totalTarefasAnalisadas));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalTarefas,
      tarefasConcluidas,
      taxaConclusao,
      mediaPrioridade,
      const DeepCollectionEquality().hash(distribuicaoPrioridades),
      tarefasUltimos30Dias,
      const DeepCollectionEquality().hash(tarefasPorDiaSemana),
      const DeepCollectionEquality().hash(tarefasPorHora),
      const DeepCollectionEquality().hash(tarefasPorSemana),
      crescimento,
      periodoAtual,
      periodoAnterior,
      const DeepCollectionEquality().hash(mediasTempoPorPrioridade),
      const DeepCollectionEquality().hash(tarefasPorPrioridade),
      const DeepCollectionEquality().hash(tarefasComRiscoDeAtraso),
      totalTarefasAnalisadas);

  @override
  String toString() {
    return 'Estatistics(totalTarefas: $totalTarefas, tarefasConcluidas: $tarefasConcluidas, taxaConclusao: $taxaConclusao, mediaPrioridade: $mediaPrioridade, distribuicaoPrioridades: $distribuicaoPrioridades, tarefasUltimos30Dias: $tarefasUltimos30Dias, tarefasPorDiaSemana: $tarefasPorDiaSemana, tarefasPorHora: $tarefasPorHora, tarefasPorSemana: $tarefasPorSemana, crescimento: $crescimento, periodoAtual: $periodoAtual, periodoAnterior: $periodoAnterior, mediasTempoPorPrioridade: $mediasTempoPorPrioridade, tarefasPorPrioridade: $tarefasPorPrioridade, tarefasComRiscoDeAtraso: $tarefasComRiscoDeAtraso, totalTarefasAnalisadas: $totalTarefasAnalisadas)';
  }
}

/// @nodoc
abstract mixin class $EstatisticsCopyWith<$Res> {
  factory $EstatisticsCopyWith(
          Estatistics value, $Res Function(Estatistics) _then) =
      _$EstatisticsCopyWithImpl;
  @useResult
  $Res call(
      {int totalTarefas,
      int tarefasConcluidas,
      double taxaConclusao,
      double mediaPrioridade,
      List<DistribuicaoPrioridade> distribuicaoPrioridades,
      int tarefasUltimos30Dias,
      List<TarefasPorDiaSemana> tarefasPorDiaSemana,
      List<TarefasPorHora> tarefasPorHora,
      List<TarefasPorSemana> tarefasPorSemana,
      double crescimento,
      double periodoAtual,
      double periodoAnterior,
      Map<String, double> mediasTempoPorPrioridade,
      Map<String, int> tarefasPorPrioridade,
      List<TarefaComRiscoDeAtraso> tarefasComRiscoDeAtraso,
      int totalTarefasAnalisadas});
}

/// @nodoc
class _$EstatisticsCopyWithImpl<$Res> implements $EstatisticsCopyWith<$Res> {
  _$EstatisticsCopyWithImpl(this._self, this._then);

  final Estatistics _self;
  final $Res Function(Estatistics) _then;

  /// Create a copy of Estatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTarefas = null,
    Object? tarefasConcluidas = null,
    Object? taxaConclusao = null,
    Object? mediaPrioridade = null,
    Object? distribuicaoPrioridades = null,
    Object? tarefasUltimos30Dias = null,
    Object? tarefasPorDiaSemana = null,
    Object? tarefasPorHora = null,
    Object? tarefasPorSemana = null,
    Object? crescimento = null,
    Object? periodoAtual = null,
    Object? periodoAnterior = null,
    Object? mediasTempoPorPrioridade = null,
    Object? tarefasPorPrioridade = null,
    Object? tarefasComRiscoDeAtraso = null,
    Object? totalTarefasAnalisadas = null,
  }) {
    return _then(_self.copyWith(
      totalTarefas: null == totalTarefas
          ? _self.totalTarefas
          : totalTarefas // ignore: cast_nullable_to_non_nullable
              as int,
      tarefasConcluidas: null == tarefasConcluidas
          ? _self.tarefasConcluidas
          : tarefasConcluidas // ignore: cast_nullable_to_non_nullable
              as int,
      taxaConclusao: null == taxaConclusao
          ? _self.taxaConclusao
          : taxaConclusao // ignore: cast_nullable_to_non_nullable
              as double,
      mediaPrioridade: null == mediaPrioridade
          ? _self.mediaPrioridade
          : mediaPrioridade // ignore: cast_nullable_to_non_nullable
              as double,
      distribuicaoPrioridades: null == distribuicaoPrioridades
          ? _self.distribuicaoPrioridades
          : distribuicaoPrioridades // ignore: cast_nullable_to_non_nullable
              as List<DistribuicaoPrioridade>,
      tarefasUltimos30Dias: null == tarefasUltimos30Dias
          ? _self.tarefasUltimos30Dias
          : tarefasUltimos30Dias // ignore: cast_nullable_to_non_nullable
              as int,
      tarefasPorDiaSemana: null == tarefasPorDiaSemana
          ? _self.tarefasPorDiaSemana
          : tarefasPorDiaSemana // ignore: cast_nullable_to_non_nullable
              as List<TarefasPorDiaSemana>,
      tarefasPorHora: null == tarefasPorHora
          ? _self.tarefasPorHora
          : tarefasPorHora // ignore: cast_nullable_to_non_nullable
              as List<TarefasPorHora>,
      tarefasPorSemana: null == tarefasPorSemana
          ? _self.tarefasPorSemana
          : tarefasPorSemana // ignore: cast_nullable_to_non_nullable
              as List<TarefasPorSemana>,
      crescimento: null == crescimento
          ? _self.crescimento
          : crescimento // ignore: cast_nullable_to_non_nullable
              as double,
      periodoAtual: null == periodoAtual
          ? _self.periodoAtual
          : periodoAtual // ignore: cast_nullable_to_non_nullable
              as double,
      periodoAnterior: null == periodoAnterior
          ? _self.periodoAnterior
          : periodoAnterior // ignore: cast_nullable_to_non_nullable
              as double,
      mediasTempoPorPrioridade: null == mediasTempoPorPrioridade
          ? _self.mediasTempoPorPrioridade
          : mediasTempoPorPrioridade // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      tarefasPorPrioridade: null == tarefasPorPrioridade
          ? _self.tarefasPorPrioridade
          : tarefasPorPrioridade // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      tarefasComRiscoDeAtraso: null == tarefasComRiscoDeAtraso
          ? _self.tarefasComRiscoDeAtraso
          : tarefasComRiscoDeAtraso // ignore: cast_nullable_to_non_nullable
              as List<TarefaComRiscoDeAtraso>,
      totalTarefasAnalisadas: null == totalTarefasAnalisadas
          ? _self.totalTarefasAnalisadas
          : totalTarefasAnalisadas // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Estatistics implements Estatistics {
  const _Estatistics(
      {required this.totalTarefas,
      required this.tarefasConcluidas,
      required this.taxaConclusao,
      required this.mediaPrioridade,
      required final List<DistribuicaoPrioridade> distribuicaoPrioridades,
      required this.tarefasUltimos30Dias,
      required final List<TarefasPorDiaSemana> tarefasPorDiaSemana,
      required final List<TarefasPorHora> tarefasPorHora,
      required final List<TarefasPorSemana> tarefasPorSemana,
      required this.crescimento,
      required this.periodoAtual,
      required this.periodoAnterior,
      required final Map<String, double> mediasTempoPorPrioridade,
      required final Map<String, int> tarefasPorPrioridade,
      required final List<TarefaComRiscoDeAtraso> tarefasComRiscoDeAtraso,
      required this.totalTarefasAnalisadas})
      : _distribuicaoPrioridades = distribuicaoPrioridades,
        _tarefasPorDiaSemana = tarefasPorDiaSemana,
        _tarefasPorHora = tarefasPorHora,
        _tarefasPorSemana = tarefasPorSemana,
        _mediasTempoPorPrioridade = mediasTempoPorPrioridade,
        _tarefasPorPrioridade = tarefasPorPrioridade,
        _tarefasComRiscoDeAtraso = tarefasComRiscoDeAtraso;
  factory _Estatistics.fromJson(Map<String, dynamic> json) =>
      _$EstatisticsFromJson(json);

// Estatísticas de produtividade
  @override
  final int totalTarefas;
  @override
  final int tarefasConcluidas;
  @override
  final double taxaConclusao;
  @override
  final double mediaPrioridade;
  final List<DistribuicaoPrioridade> _distribuicaoPrioridades;
  @override
  List<DistribuicaoPrioridade> get distribuicaoPrioridades {
    if (_distribuicaoPrioridades is EqualUnmodifiableListView)
      return _distribuicaoPrioridades;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_distribuicaoPrioridades);
  }

  @override
  final int tarefasUltimos30Dias;
// Estatísticas temporais
  final List<TarefasPorDiaSemana> _tarefasPorDiaSemana;
// Estatísticas temporais
  @override
  List<TarefasPorDiaSemana> get tarefasPorDiaSemana {
    if (_tarefasPorDiaSemana is EqualUnmodifiableListView)
      return _tarefasPorDiaSemana;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tarefasPorDiaSemana);
  }

  final List<TarefasPorHora> _tarefasPorHora;
  @override
  List<TarefasPorHora> get tarefasPorHora {
    if (_tarefasPorHora is EqualUnmodifiableListView) return _tarefasPorHora;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tarefasPorHora);
  }

  final List<TarefasPorSemana> _tarefasPorSemana;
  @override
  List<TarefasPorSemana> get tarefasPorSemana {
    if (_tarefasPorSemana is EqualUnmodifiableListView)
      return _tarefasPorSemana;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tarefasPorSemana);
  }

  @override
  final double crescimento;
  @override
  final double periodoAtual;
  @override
  final double periodoAnterior;
// Estatísticas preditivas
  final Map<String, double> _mediasTempoPorPrioridade;
// Estatísticas preditivas
  @override
  Map<String, double> get mediasTempoPorPrioridade {
    if (_mediasTempoPorPrioridade is EqualUnmodifiableMapView)
      return _mediasTempoPorPrioridade;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_mediasTempoPorPrioridade);
  }

  final Map<String, int> _tarefasPorPrioridade;
  @override
  Map<String, int> get tarefasPorPrioridade {
    if (_tarefasPorPrioridade is EqualUnmodifiableMapView)
      return _tarefasPorPrioridade;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tarefasPorPrioridade);
  }

  final List<TarefaComRiscoDeAtraso> _tarefasComRiscoDeAtraso;
  @override
  List<TarefaComRiscoDeAtraso> get tarefasComRiscoDeAtraso {
    if (_tarefasComRiscoDeAtraso is EqualUnmodifiableListView)
      return _tarefasComRiscoDeAtraso;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tarefasComRiscoDeAtraso);
  }

  @override
  final int totalTarefasAnalisadas;

  /// Create a copy of Estatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EstatisticsCopyWith<_Estatistics> get copyWith =>
      __$EstatisticsCopyWithImpl<_Estatistics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EstatisticsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Estatistics &&
            (identical(other.totalTarefas, totalTarefas) ||
                other.totalTarefas == totalTarefas) &&
            (identical(other.tarefasConcluidas, tarefasConcluidas) ||
                other.tarefasConcluidas == tarefasConcluidas) &&
            (identical(other.taxaConclusao, taxaConclusao) ||
                other.taxaConclusao == taxaConclusao) &&
            (identical(other.mediaPrioridade, mediaPrioridade) ||
                other.mediaPrioridade == mediaPrioridade) &&
            const DeepCollectionEquality().equals(
                other._distribuicaoPrioridades, _distribuicaoPrioridades) &&
            (identical(other.tarefasUltimos30Dias, tarefasUltimos30Dias) ||
                other.tarefasUltimos30Dias == tarefasUltimos30Dias) &&
            const DeepCollectionEquality()
                .equals(other._tarefasPorDiaSemana, _tarefasPorDiaSemana) &&
            const DeepCollectionEquality()
                .equals(other._tarefasPorHora, _tarefasPorHora) &&
            const DeepCollectionEquality()
                .equals(other._tarefasPorSemana, _tarefasPorSemana) &&
            (identical(other.crescimento, crescimento) ||
                other.crescimento == crescimento) &&
            (identical(other.periodoAtual, periodoAtual) ||
                other.periodoAtual == periodoAtual) &&
            (identical(other.periodoAnterior, periodoAnterior) ||
                other.periodoAnterior == periodoAnterior) &&
            const DeepCollectionEquality().equals(
                other._mediasTempoPorPrioridade, _mediasTempoPorPrioridade) &&
            const DeepCollectionEquality()
                .equals(other._tarefasPorPrioridade, _tarefasPorPrioridade) &&
            const DeepCollectionEquality().equals(
                other._tarefasComRiscoDeAtraso, _tarefasComRiscoDeAtraso) &&
            (identical(other.totalTarefasAnalisadas, totalTarefasAnalisadas) ||
                other.totalTarefasAnalisadas == totalTarefasAnalisadas));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalTarefas,
      tarefasConcluidas,
      taxaConclusao,
      mediaPrioridade,
      const DeepCollectionEquality().hash(_distribuicaoPrioridades),
      tarefasUltimos30Dias,
      const DeepCollectionEquality().hash(_tarefasPorDiaSemana),
      const DeepCollectionEquality().hash(_tarefasPorHora),
      const DeepCollectionEquality().hash(_tarefasPorSemana),
      crescimento,
      periodoAtual,
      periodoAnterior,
      const DeepCollectionEquality().hash(_mediasTempoPorPrioridade),
      const DeepCollectionEquality().hash(_tarefasPorPrioridade),
      const DeepCollectionEquality().hash(_tarefasComRiscoDeAtraso),
      totalTarefasAnalisadas);

  @override
  String toString() {
    return 'Estatistics(totalTarefas: $totalTarefas, tarefasConcluidas: $tarefasConcluidas, taxaConclusao: $taxaConclusao, mediaPrioridade: $mediaPrioridade, distribuicaoPrioridades: $distribuicaoPrioridades, tarefasUltimos30Dias: $tarefasUltimos30Dias, tarefasPorDiaSemana: $tarefasPorDiaSemana, tarefasPorHora: $tarefasPorHora, tarefasPorSemana: $tarefasPorSemana, crescimento: $crescimento, periodoAtual: $periodoAtual, periodoAnterior: $periodoAnterior, mediasTempoPorPrioridade: $mediasTempoPorPrioridade, tarefasPorPrioridade: $tarefasPorPrioridade, tarefasComRiscoDeAtraso: $tarefasComRiscoDeAtraso, totalTarefasAnalisadas: $totalTarefasAnalisadas)';
  }
}

/// @nodoc
abstract mixin class _$EstatisticsCopyWith<$Res>
    implements $EstatisticsCopyWith<$Res> {
  factory _$EstatisticsCopyWith(
          _Estatistics value, $Res Function(_Estatistics) _then) =
      __$EstatisticsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int totalTarefas,
      int tarefasConcluidas,
      double taxaConclusao,
      double mediaPrioridade,
      List<DistribuicaoPrioridade> distribuicaoPrioridades,
      int tarefasUltimos30Dias,
      List<TarefasPorDiaSemana> tarefasPorDiaSemana,
      List<TarefasPorHora> tarefasPorHora,
      List<TarefasPorSemana> tarefasPorSemana,
      double crescimento,
      double periodoAtual,
      double periodoAnterior,
      Map<String, double> mediasTempoPorPrioridade,
      Map<String, int> tarefasPorPrioridade,
      List<TarefaComRiscoDeAtraso> tarefasComRiscoDeAtraso,
      int totalTarefasAnalisadas});
}

/// @nodoc
class __$EstatisticsCopyWithImpl<$Res> implements _$EstatisticsCopyWith<$Res> {
  __$EstatisticsCopyWithImpl(this._self, this._then);

  final _Estatistics _self;
  final $Res Function(_Estatistics) _then;

  /// Create a copy of Estatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalTarefas = null,
    Object? tarefasConcluidas = null,
    Object? taxaConclusao = null,
    Object? mediaPrioridade = null,
    Object? distribuicaoPrioridades = null,
    Object? tarefasUltimos30Dias = null,
    Object? tarefasPorDiaSemana = null,
    Object? tarefasPorHora = null,
    Object? tarefasPorSemana = null,
    Object? crescimento = null,
    Object? periodoAtual = null,
    Object? periodoAnterior = null,
    Object? mediasTempoPorPrioridade = null,
    Object? tarefasPorPrioridade = null,
    Object? tarefasComRiscoDeAtraso = null,
    Object? totalTarefasAnalisadas = null,
  }) {
    return _then(_Estatistics(
      totalTarefas: null == totalTarefas
          ? _self.totalTarefas
          : totalTarefas // ignore: cast_nullable_to_non_nullable
              as int,
      tarefasConcluidas: null == tarefasConcluidas
          ? _self.tarefasConcluidas
          : tarefasConcluidas // ignore: cast_nullable_to_non_nullable
              as int,
      taxaConclusao: null == taxaConclusao
          ? _self.taxaConclusao
          : taxaConclusao // ignore: cast_nullable_to_non_nullable
              as double,
      mediaPrioridade: null == mediaPrioridade
          ? _self.mediaPrioridade
          : mediaPrioridade // ignore: cast_nullable_to_non_nullable
              as double,
      distribuicaoPrioridades: null == distribuicaoPrioridades
          ? _self._distribuicaoPrioridades
          : distribuicaoPrioridades // ignore: cast_nullable_to_non_nullable
              as List<DistribuicaoPrioridade>,
      tarefasUltimos30Dias: null == tarefasUltimos30Dias
          ? _self.tarefasUltimos30Dias
          : tarefasUltimos30Dias // ignore: cast_nullable_to_non_nullable
              as int,
      tarefasPorDiaSemana: null == tarefasPorDiaSemana
          ? _self._tarefasPorDiaSemana
          : tarefasPorDiaSemana // ignore: cast_nullable_to_non_nullable
              as List<TarefasPorDiaSemana>,
      tarefasPorHora: null == tarefasPorHora
          ? _self._tarefasPorHora
          : tarefasPorHora // ignore: cast_nullable_to_non_nullable
              as List<TarefasPorHora>,
      tarefasPorSemana: null == tarefasPorSemana
          ? _self._tarefasPorSemana
          : tarefasPorSemana // ignore: cast_nullable_to_non_nullable
              as List<TarefasPorSemana>,
      crescimento: null == crescimento
          ? _self.crescimento
          : crescimento // ignore: cast_nullable_to_non_nullable
              as double,
      periodoAtual: null == periodoAtual
          ? _self.periodoAtual
          : periodoAtual // ignore: cast_nullable_to_non_nullable
              as double,
      periodoAnterior: null == periodoAnterior
          ? _self.periodoAnterior
          : periodoAnterior // ignore: cast_nullable_to_non_nullable
              as double,
      mediasTempoPorPrioridade: null == mediasTempoPorPrioridade
          ? _self._mediasTempoPorPrioridade
          : mediasTempoPorPrioridade // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      tarefasPorPrioridade: null == tarefasPorPrioridade
          ? _self._tarefasPorPrioridade
          : tarefasPorPrioridade // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      tarefasComRiscoDeAtraso: null == tarefasComRiscoDeAtraso
          ? _self._tarefasComRiscoDeAtraso
          : tarefasComRiscoDeAtraso // ignore: cast_nullable_to_non_nullable
              as List<TarefaComRiscoDeAtraso>,
      totalTarefasAnalisadas: null == totalTarefasAnalisadas
          ? _self.totalTarefasAnalisadas
          : totalTarefasAnalisadas // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$DistribuicaoPrioridade {
  int get prioridade;
  int get quantidade;

  /// Create a copy of DistribuicaoPrioridade
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DistribuicaoPrioridadeCopyWith<DistribuicaoPrioridade> get copyWith =>
      _$DistribuicaoPrioridadeCopyWithImpl<DistribuicaoPrioridade>(
          this as DistribuicaoPrioridade, _$identity);

  /// Serializes this DistribuicaoPrioridade to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DistribuicaoPrioridade &&
            (identical(other.prioridade, prioridade) ||
                other.prioridade == prioridade) &&
            (identical(other.quantidade, quantidade) ||
                other.quantidade == quantidade));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, prioridade, quantidade);

  @override
  String toString() {
    return 'DistribuicaoPrioridade(prioridade: $prioridade, quantidade: $quantidade)';
  }
}

/// @nodoc
abstract mixin class $DistribuicaoPrioridadeCopyWith<$Res> {
  factory $DistribuicaoPrioridadeCopyWith(DistribuicaoPrioridade value,
          $Res Function(DistribuicaoPrioridade) _then) =
      _$DistribuicaoPrioridadeCopyWithImpl;
  @useResult
  $Res call({int prioridade, int quantidade});
}

/// @nodoc
class _$DistribuicaoPrioridadeCopyWithImpl<$Res>
    implements $DistribuicaoPrioridadeCopyWith<$Res> {
  _$DistribuicaoPrioridadeCopyWithImpl(this._self, this._then);

  final DistribuicaoPrioridade _self;
  final $Res Function(DistribuicaoPrioridade) _then;

  /// Create a copy of DistribuicaoPrioridade
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prioridade = null,
    Object? quantidade = null,
  }) {
    return _then(_self.copyWith(
      prioridade: null == prioridade
          ? _self.prioridade
          : prioridade // ignore: cast_nullable_to_non_nullable
              as int,
      quantidade: null == quantidade
          ? _self.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DistribuicaoPrioridade implements DistribuicaoPrioridade {
  const _DistribuicaoPrioridade(
      {required this.prioridade, required this.quantidade});
  factory _DistribuicaoPrioridade.fromJson(Map<String, dynamic> json) =>
      _$DistribuicaoPrioridadeFromJson(json);

  @override
  final int prioridade;
  @override
  final int quantidade;

  /// Create a copy of DistribuicaoPrioridade
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DistribuicaoPrioridadeCopyWith<_DistribuicaoPrioridade> get copyWith =>
      __$DistribuicaoPrioridadeCopyWithImpl<_DistribuicaoPrioridade>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DistribuicaoPrioridadeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DistribuicaoPrioridade &&
            (identical(other.prioridade, prioridade) ||
                other.prioridade == prioridade) &&
            (identical(other.quantidade, quantidade) ||
                other.quantidade == quantidade));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, prioridade, quantidade);

  @override
  String toString() {
    return 'DistribuicaoPrioridade(prioridade: $prioridade, quantidade: $quantidade)';
  }
}

/// @nodoc
abstract mixin class _$DistribuicaoPrioridadeCopyWith<$Res>
    implements $DistribuicaoPrioridadeCopyWith<$Res> {
  factory _$DistribuicaoPrioridadeCopyWith(_DistribuicaoPrioridade value,
          $Res Function(_DistribuicaoPrioridade) _then) =
      __$DistribuicaoPrioridadeCopyWithImpl;
  @override
  @useResult
  $Res call({int prioridade, int quantidade});
}

/// @nodoc
class __$DistribuicaoPrioridadeCopyWithImpl<$Res>
    implements _$DistribuicaoPrioridadeCopyWith<$Res> {
  __$DistribuicaoPrioridadeCopyWithImpl(this._self, this._then);

  final _DistribuicaoPrioridade _self;
  final $Res Function(_DistribuicaoPrioridade) _then;

  /// Create a copy of DistribuicaoPrioridade
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? prioridade = null,
    Object? quantidade = null,
  }) {
    return _then(_DistribuicaoPrioridade(
      prioridade: null == prioridade
          ? _self.prioridade
          : prioridade // ignore: cast_nullable_to_non_nullable
              as int,
      quantidade: null == quantidade
          ? _self.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$TarefasPorDiaSemana {
  int get diaSemana;
  int get quantidade;

  /// Create a copy of TarefasPorDiaSemana
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TarefasPorDiaSemanaCopyWith<TarefasPorDiaSemana> get copyWith =>
      _$TarefasPorDiaSemanaCopyWithImpl<TarefasPorDiaSemana>(
          this as TarefasPorDiaSemana, _$identity);

  /// Serializes this TarefasPorDiaSemana to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TarefasPorDiaSemana &&
            (identical(other.diaSemana, diaSemana) ||
                other.diaSemana == diaSemana) &&
            (identical(other.quantidade, quantidade) ||
                other.quantidade == quantidade));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, diaSemana, quantidade);

  @override
  String toString() {
    return 'TarefasPorDiaSemana(diaSemana: $diaSemana, quantidade: $quantidade)';
  }
}

/// @nodoc
abstract mixin class $TarefasPorDiaSemanaCopyWith<$Res> {
  factory $TarefasPorDiaSemanaCopyWith(
          TarefasPorDiaSemana value, $Res Function(TarefasPorDiaSemana) _then) =
      _$TarefasPorDiaSemanaCopyWithImpl;
  @useResult
  $Res call({int diaSemana, int quantidade});
}

/// @nodoc
class _$TarefasPorDiaSemanaCopyWithImpl<$Res>
    implements $TarefasPorDiaSemanaCopyWith<$Res> {
  _$TarefasPorDiaSemanaCopyWithImpl(this._self, this._then);

  final TarefasPorDiaSemana _self;
  final $Res Function(TarefasPorDiaSemana) _then;

  /// Create a copy of TarefasPorDiaSemana
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diaSemana = null,
    Object? quantidade = null,
  }) {
    return _then(_self.copyWith(
      diaSemana: null == diaSemana
          ? _self.diaSemana
          : diaSemana // ignore: cast_nullable_to_non_nullable
              as int,
      quantidade: null == quantidade
          ? _self.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TarefasPorDiaSemana implements TarefasPorDiaSemana {
  const _TarefasPorDiaSemana(
      {required this.diaSemana, required this.quantidade});
  factory _TarefasPorDiaSemana.fromJson(Map<String, dynamic> json) =>
      _$TarefasPorDiaSemanaFromJson(json);

  @override
  final int diaSemana;
  @override
  final int quantidade;

  /// Create a copy of TarefasPorDiaSemana
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TarefasPorDiaSemanaCopyWith<_TarefasPorDiaSemana> get copyWith =>
      __$TarefasPorDiaSemanaCopyWithImpl<_TarefasPorDiaSemana>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TarefasPorDiaSemanaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TarefasPorDiaSemana &&
            (identical(other.diaSemana, diaSemana) ||
                other.diaSemana == diaSemana) &&
            (identical(other.quantidade, quantidade) ||
                other.quantidade == quantidade));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, diaSemana, quantidade);

  @override
  String toString() {
    return 'TarefasPorDiaSemana(diaSemana: $diaSemana, quantidade: $quantidade)';
  }
}

/// @nodoc
abstract mixin class _$TarefasPorDiaSemanaCopyWith<$Res>
    implements $TarefasPorDiaSemanaCopyWith<$Res> {
  factory _$TarefasPorDiaSemanaCopyWith(_TarefasPorDiaSemana value,
          $Res Function(_TarefasPorDiaSemana) _then) =
      __$TarefasPorDiaSemanaCopyWithImpl;
  @override
  @useResult
  $Res call({int diaSemana, int quantidade});
}

/// @nodoc
class __$TarefasPorDiaSemanaCopyWithImpl<$Res>
    implements _$TarefasPorDiaSemanaCopyWith<$Res> {
  __$TarefasPorDiaSemanaCopyWithImpl(this._self, this._then);

  final _TarefasPorDiaSemana _self;
  final $Res Function(_TarefasPorDiaSemana) _then;

  /// Create a copy of TarefasPorDiaSemana
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? diaSemana = null,
    Object? quantidade = null,
  }) {
    return _then(_TarefasPorDiaSemana(
      diaSemana: null == diaSemana
          ? _self.diaSemana
          : diaSemana // ignore: cast_nullable_to_non_nullable
              as int,
      quantidade: null == quantidade
          ? _self.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$TarefasPorHora {
  int get hora;
  int get quantidade;

  /// Create a copy of TarefasPorHora
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TarefasPorHoraCopyWith<TarefasPorHora> get copyWith =>
      _$TarefasPorHoraCopyWithImpl<TarefasPorHora>(
          this as TarefasPorHora, _$identity);

  /// Serializes this TarefasPorHora to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TarefasPorHora &&
            (identical(other.hora, hora) || other.hora == hora) &&
            (identical(other.quantidade, quantidade) ||
                other.quantidade == quantidade));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hora, quantidade);

  @override
  String toString() {
    return 'TarefasPorHora(hora: $hora, quantidade: $quantidade)';
  }
}

/// @nodoc
abstract mixin class $TarefasPorHoraCopyWith<$Res> {
  factory $TarefasPorHoraCopyWith(
          TarefasPorHora value, $Res Function(TarefasPorHora) _then) =
      _$TarefasPorHoraCopyWithImpl;
  @useResult
  $Res call({int hora, int quantidade});
}

/// @nodoc
class _$TarefasPorHoraCopyWithImpl<$Res>
    implements $TarefasPorHoraCopyWith<$Res> {
  _$TarefasPorHoraCopyWithImpl(this._self, this._then);

  final TarefasPorHora _self;
  final $Res Function(TarefasPorHora) _then;

  /// Create a copy of TarefasPorHora
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hora = null,
    Object? quantidade = null,
  }) {
    return _then(_self.copyWith(
      hora: null == hora
          ? _self.hora
          : hora // ignore: cast_nullable_to_non_nullable
              as int,
      quantidade: null == quantidade
          ? _self.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TarefasPorHora implements TarefasPorHora {
  const _TarefasPorHora({required this.hora, required this.quantidade});
  factory _TarefasPorHora.fromJson(Map<String, dynamic> json) =>
      _$TarefasPorHoraFromJson(json);

  @override
  final int hora;
  @override
  final int quantidade;

  /// Create a copy of TarefasPorHora
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TarefasPorHoraCopyWith<_TarefasPorHora> get copyWith =>
      __$TarefasPorHoraCopyWithImpl<_TarefasPorHora>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TarefasPorHoraToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TarefasPorHora &&
            (identical(other.hora, hora) || other.hora == hora) &&
            (identical(other.quantidade, quantidade) ||
                other.quantidade == quantidade));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hora, quantidade);

  @override
  String toString() {
    return 'TarefasPorHora(hora: $hora, quantidade: $quantidade)';
  }
}

/// @nodoc
abstract mixin class _$TarefasPorHoraCopyWith<$Res>
    implements $TarefasPorHoraCopyWith<$Res> {
  factory _$TarefasPorHoraCopyWith(
          _TarefasPorHora value, $Res Function(_TarefasPorHora) _then) =
      __$TarefasPorHoraCopyWithImpl;
  @override
  @useResult
  $Res call({int hora, int quantidade});
}

/// @nodoc
class __$TarefasPorHoraCopyWithImpl<$Res>
    implements _$TarefasPorHoraCopyWith<$Res> {
  __$TarefasPorHoraCopyWithImpl(this._self, this._then);

  final _TarefasPorHora _self;
  final $Res Function(_TarefasPorHora) _then;

  /// Create a copy of TarefasPorHora
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hora = null,
    Object? quantidade = null,
  }) {
    return _then(_TarefasPorHora(
      hora: null == hora
          ? _self.hora
          : hora // ignore: cast_nullable_to_non_nullable
              as int,
      quantidade: null == quantidade
          ? _self.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$TarefasPorSemana {
  int get semana;
  int get quantidade;

  /// Create a copy of TarefasPorSemana
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TarefasPorSemanaCopyWith<TarefasPorSemana> get copyWith =>
      _$TarefasPorSemanaCopyWithImpl<TarefasPorSemana>(
          this as TarefasPorSemana, _$identity);

  /// Serializes this TarefasPorSemana to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TarefasPorSemana &&
            (identical(other.semana, semana) || other.semana == semana) &&
            (identical(other.quantidade, quantidade) ||
                other.quantidade == quantidade));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, semana, quantidade);

  @override
  String toString() {
    return 'TarefasPorSemana(semana: $semana, quantidade: $quantidade)';
  }
}

/// @nodoc
abstract mixin class $TarefasPorSemanaCopyWith<$Res> {
  factory $TarefasPorSemanaCopyWith(
          TarefasPorSemana value, $Res Function(TarefasPorSemana) _then) =
      _$TarefasPorSemanaCopyWithImpl;
  @useResult
  $Res call({int semana, int quantidade});
}

/// @nodoc
class _$TarefasPorSemanaCopyWithImpl<$Res>
    implements $TarefasPorSemanaCopyWith<$Res> {
  _$TarefasPorSemanaCopyWithImpl(this._self, this._then);

  final TarefasPorSemana _self;
  final $Res Function(TarefasPorSemana) _then;

  /// Create a copy of TarefasPorSemana
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? semana = null,
    Object? quantidade = null,
  }) {
    return _then(_self.copyWith(
      semana: null == semana
          ? _self.semana
          : semana // ignore: cast_nullable_to_non_nullable
              as int,
      quantidade: null == quantidade
          ? _self.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TarefasPorSemana implements TarefasPorSemana {
  const _TarefasPorSemana({required this.semana, required this.quantidade});
  factory _TarefasPorSemana.fromJson(Map<String, dynamic> json) =>
      _$TarefasPorSemanaFromJson(json);

  @override
  final int semana;
  @override
  final int quantidade;

  /// Create a copy of TarefasPorSemana
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TarefasPorSemanaCopyWith<_TarefasPorSemana> get copyWith =>
      __$TarefasPorSemanaCopyWithImpl<_TarefasPorSemana>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TarefasPorSemanaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TarefasPorSemana &&
            (identical(other.semana, semana) || other.semana == semana) &&
            (identical(other.quantidade, quantidade) ||
                other.quantidade == quantidade));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, semana, quantidade);

  @override
  String toString() {
    return 'TarefasPorSemana(semana: $semana, quantidade: $quantidade)';
  }
}

/// @nodoc
abstract mixin class _$TarefasPorSemanaCopyWith<$Res>
    implements $TarefasPorSemanaCopyWith<$Res> {
  factory _$TarefasPorSemanaCopyWith(
          _TarefasPorSemana value, $Res Function(_TarefasPorSemana) _then) =
      __$TarefasPorSemanaCopyWithImpl;
  @override
  @useResult
  $Res call({int semana, int quantidade});
}

/// @nodoc
class __$TarefasPorSemanaCopyWithImpl<$Res>
    implements _$TarefasPorSemanaCopyWith<$Res> {
  __$TarefasPorSemanaCopyWithImpl(this._self, this._then);

  final _TarefasPorSemana _self;
  final $Res Function(_TarefasPorSemana) _then;

  /// Create a copy of TarefasPorSemana
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? semana = null,
    Object? quantidade = null,
  }) {
    return _then(_TarefasPorSemana(
      semana: null == semana
          ? _self.semana
          : semana // ignore: cast_nullable_to_non_nullable
              as int,
      quantidade: null == quantidade
          ? _self.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$TarefaComRiscoDeAtraso {
  int get taskId;
  String get titulo;
  int get prioridade;
  double get tempoDecorrido;
  double get tempoMedioEsperado;
  bool get risco;

  /// Create a copy of TarefaComRiscoDeAtraso
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TarefaComRiscoDeAtrasoCopyWith<TarefaComRiscoDeAtraso> get copyWith =>
      _$TarefaComRiscoDeAtrasoCopyWithImpl<TarefaComRiscoDeAtraso>(
          this as TarefaComRiscoDeAtraso, _$identity);

  /// Serializes this TarefaComRiscoDeAtraso to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TarefaComRiscoDeAtraso &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.titulo, titulo) || other.titulo == titulo) &&
            (identical(other.prioridade, prioridade) ||
                other.prioridade == prioridade) &&
            (identical(other.tempoDecorrido, tempoDecorrido) ||
                other.tempoDecorrido == tempoDecorrido) &&
            (identical(other.tempoMedioEsperado, tempoMedioEsperado) ||
                other.tempoMedioEsperado == tempoMedioEsperado) &&
            (identical(other.risco, risco) || other.risco == risco));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, taskId, titulo, prioridade,
      tempoDecorrido, tempoMedioEsperado, risco);

  @override
  String toString() {
    return 'TarefaComRiscoDeAtraso(taskId: $taskId, titulo: $titulo, prioridade: $prioridade, tempoDecorrido: $tempoDecorrido, tempoMedioEsperado: $tempoMedioEsperado, risco: $risco)';
  }
}

/// @nodoc
abstract mixin class $TarefaComRiscoDeAtrasoCopyWith<$Res> {
  factory $TarefaComRiscoDeAtrasoCopyWith(TarefaComRiscoDeAtraso value,
          $Res Function(TarefaComRiscoDeAtraso) _then) =
      _$TarefaComRiscoDeAtrasoCopyWithImpl;
  @useResult
  $Res call(
      {int taskId,
      String titulo,
      int prioridade,
      double tempoDecorrido,
      double tempoMedioEsperado,
      bool risco});
}

/// @nodoc
class _$TarefaComRiscoDeAtrasoCopyWithImpl<$Res>
    implements $TarefaComRiscoDeAtrasoCopyWith<$Res> {
  _$TarefaComRiscoDeAtrasoCopyWithImpl(this._self, this._then);

  final TarefaComRiscoDeAtraso _self;
  final $Res Function(TarefaComRiscoDeAtraso) _then;

  /// Create a copy of TarefaComRiscoDeAtraso
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? titulo = null,
    Object? prioridade = null,
    Object? tempoDecorrido = null,
    Object? tempoMedioEsperado = null,
    Object? risco = null,
  }) {
    return _then(_self.copyWith(
      taskId: null == taskId
          ? _self.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
      titulo: null == titulo
          ? _self.titulo
          : titulo // ignore: cast_nullable_to_non_nullable
              as String,
      prioridade: null == prioridade
          ? _self.prioridade
          : prioridade // ignore: cast_nullable_to_non_nullable
              as int,
      tempoDecorrido: null == tempoDecorrido
          ? _self.tempoDecorrido
          : tempoDecorrido // ignore: cast_nullable_to_non_nullable
              as double,
      tempoMedioEsperado: null == tempoMedioEsperado
          ? _self.tempoMedioEsperado
          : tempoMedioEsperado // ignore: cast_nullable_to_non_nullable
              as double,
      risco: null == risco
          ? _self.risco
          : risco // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TarefaComRiscoDeAtraso implements TarefaComRiscoDeAtraso {
  const _TarefaComRiscoDeAtraso(
      {required this.taskId,
      required this.titulo,
      required this.prioridade,
      required this.tempoDecorrido,
      required this.tempoMedioEsperado,
      required this.risco});
  factory _TarefaComRiscoDeAtraso.fromJson(Map<String, dynamic> json) =>
      _$TarefaComRiscoDeAtrasoFromJson(json);

  @override
  final int taskId;
  @override
  final String titulo;
  @override
  final int prioridade;
  @override
  final double tempoDecorrido;
  @override
  final double tempoMedioEsperado;
  @override
  final bool risco;

  /// Create a copy of TarefaComRiscoDeAtraso
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TarefaComRiscoDeAtrasoCopyWith<_TarefaComRiscoDeAtraso> get copyWith =>
      __$TarefaComRiscoDeAtrasoCopyWithImpl<_TarefaComRiscoDeAtraso>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TarefaComRiscoDeAtrasoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TarefaComRiscoDeAtraso &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.titulo, titulo) || other.titulo == titulo) &&
            (identical(other.prioridade, prioridade) ||
                other.prioridade == prioridade) &&
            (identical(other.tempoDecorrido, tempoDecorrido) ||
                other.tempoDecorrido == tempoDecorrido) &&
            (identical(other.tempoMedioEsperado, tempoMedioEsperado) ||
                other.tempoMedioEsperado == tempoMedioEsperado) &&
            (identical(other.risco, risco) || other.risco == risco));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, taskId, titulo, prioridade,
      tempoDecorrido, tempoMedioEsperado, risco);

  @override
  String toString() {
    return 'TarefaComRiscoDeAtraso(taskId: $taskId, titulo: $titulo, prioridade: $prioridade, tempoDecorrido: $tempoDecorrido, tempoMedioEsperado: $tempoMedioEsperado, risco: $risco)';
  }
}

/// @nodoc
abstract mixin class _$TarefaComRiscoDeAtrasoCopyWith<$Res>
    implements $TarefaComRiscoDeAtrasoCopyWith<$Res> {
  factory _$TarefaComRiscoDeAtrasoCopyWith(_TarefaComRiscoDeAtraso value,
          $Res Function(_TarefaComRiscoDeAtraso) _then) =
      __$TarefaComRiscoDeAtrasoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int taskId,
      String titulo,
      int prioridade,
      double tempoDecorrido,
      double tempoMedioEsperado,
      bool risco});
}

/// @nodoc
class __$TarefaComRiscoDeAtrasoCopyWithImpl<$Res>
    implements _$TarefaComRiscoDeAtrasoCopyWith<$Res> {
  __$TarefaComRiscoDeAtrasoCopyWithImpl(this._self, this._then);

  final _TarefaComRiscoDeAtraso _self;
  final $Res Function(_TarefaComRiscoDeAtraso) _then;

  /// Create a copy of TarefaComRiscoDeAtraso
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? taskId = null,
    Object? titulo = null,
    Object? prioridade = null,
    Object? tempoDecorrido = null,
    Object? tempoMedioEsperado = null,
    Object? risco = null,
  }) {
    return _then(_TarefaComRiscoDeAtraso(
      taskId: null == taskId
          ? _self.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
      titulo: null == titulo
          ? _self.titulo
          : titulo // ignore: cast_nullable_to_non_nullable
              as String,
      prioridade: null == prioridade
          ? _self.prioridade
          : prioridade // ignore: cast_nullable_to_non_nullable
              as int,
      tempoDecorrido: null == tempoDecorrido
          ? _self.tempoDecorrido
          : tempoDecorrido // ignore: cast_nullable_to_non_nullable
              as double,
      tempoMedioEsperado: null == tempoMedioEsperado
          ? _self.tempoMedioEsperado
          : tempoMedioEsperado // ignore: cast_nullable_to_non_nullable
              as double,
      risco: null == risco
          ? _self.risco
          : risco // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
