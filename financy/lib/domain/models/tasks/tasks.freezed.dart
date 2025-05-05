// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Task {
  int get taskId;
  String get titulo;
  String get descricao;
  int get statusId;
  int get usuarioId;
  DateTime get criadoEm;
  int get prioridade;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskCopyWith<Task> get copyWith =>
      _$TaskCopyWithImpl<Task>(this as Task, _$identity);

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Task &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.titulo, titulo) || other.titulo == titulo) &&
            (identical(other.descricao, descricao) ||
                other.descricao == descricao) &&
            (identical(other.statusId, statusId) ||
                other.statusId == statusId) &&
            (identical(other.usuarioId, usuarioId) ||
                other.usuarioId == usuarioId) &&
            (identical(other.criadoEm, criadoEm) ||
                other.criadoEm == criadoEm) &&
            (identical(other.prioridade, prioridade) ||
                other.prioridade == prioridade));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, taskId, titulo, descricao,
      statusId, usuarioId, criadoEm, prioridade);

  @override
  String toString() {
    return 'Task(taskId: $taskId, titulo: $titulo, descricao: $descricao, statusId: $statusId, usuarioId: $usuarioId, criadoEm: $criadoEm, prioridade: $prioridade)';
  }
}

/// @nodoc
abstract mixin class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) _then) =
      _$TaskCopyWithImpl;
  @useResult
  $Res call(
      {int taskId,
      String titulo,
      String descricao,
      int statusId,
      int usuarioId,
      DateTime criadoEm,
      int prioridade});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._self, this._then);

  final Task _self;
  final $Res Function(Task) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? titulo = null,
    Object? descricao = null,
    Object? statusId = null,
    Object? usuarioId = null,
    Object? criadoEm = null,
    Object? prioridade = null,
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
      descricao: null == descricao
          ? _self.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      statusId: null == statusId
          ? _self.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int,
      usuarioId: null == usuarioId
          ? _self.usuarioId
          : usuarioId // ignore: cast_nullable_to_non_nullable
              as int,
      criadoEm: null == criadoEm
          ? _self.criadoEm
          : criadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      prioridade: null == prioridade
          ? _self.prioridade
          : prioridade // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Task implements Task {
  const _Task(
      {required this.taskId,
      required this.titulo,
      required this.descricao,
      required this.statusId,
      required this.usuarioId,
      required this.criadoEm,
      required this.prioridade});
  factory _Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  @override
  final int taskId;
  @override
  final String titulo;
  @override
  final String descricao;
  @override
  final int statusId;
  @override
  final int usuarioId;
  @override
  final DateTime criadoEm;
  @override
  final int prioridade;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskCopyWith<_Task> get copyWith =>
      __$TaskCopyWithImpl<_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TaskToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Task &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.titulo, titulo) || other.titulo == titulo) &&
            (identical(other.descricao, descricao) ||
                other.descricao == descricao) &&
            (identical(other.statusId, statusId) ||
                other.statusId == statusId) &&
            (identical(other.usuarioId, usuarioId) ||
                other.usuarioId == usuarioId) &&
            (identical(other.criadoEm, criadoEm) ||
                other.criadoEm == criadoEm) &&
            (identical(other.prioridade, prioridade) ||
                other.prioridade == prioridade));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, taskId, titulo, descricao,
      statusId, usuarioId, criadoEm, prioridade);

  @override
  String toString() {
    return 'Task(taskId: $taskId, titulo: $titulo, descricao: $descricao, statusId: $statusId, usuarioId: $usuarioId, criadoEm: $criadoEm, prioridade: $prioridade)';
  }
}

/// @nodoc
abstract mixin class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) _then) =
      __$TaskCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int taskId,
      String titulo,
      String descricao,
      int statusId,
      int usuarioId,
      DateTime criadoEm,
      int prioridade});
}

/// @nodoc
class __$TaskCopyWithImpl<$Res> implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(this._self, this._then);

  final _Task _self;
  final $Res Function(_Task) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? taskId = null,
    Object? titulo = null,
    Object? descricao = null,
    Object? statusId = null,
    Object? usuarioId = null,
    Object? criadoEm = null,
    Object? prioridade = null,
  }) {
    return _then(_Task(
      taskId: null == taskId
          ? _self.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
      titulo: null == titulo
          ? _self.titulo
          : titulo // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: null == descricao
          ? _self.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      statusId: null == statusId
          ? _self.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int,
      usuarioId: null == usuarioId
          ? _self.usuarioId
          : usuarioId // ignore: cast_nullable_to_non_nullable
              as int,
      criadoEm: null == criadoEm
          ? _self.criadoEm
          : criadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      prioridade: null == prioridade
          ? _self.prioridade
          : prioridade // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
