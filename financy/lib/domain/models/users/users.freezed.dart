// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {
  int get id;
  String get email;
  String get nomeUsuario;
  String get senha;
  List<Task> get tarefas;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserCopyWith<User> get copyWith =>
      _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.nomeUsuario, nomeUsuario) ||
                other.nomeUsuario == nomeUsuario) &&
            (identical(other.senha, senha) || other.senha == senha) &&
            const DeepCollectionEquality().equals(other.tarefas, tarefas));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, nomeUsuario, senha,
      const DeepCollectionEquality().hash(tarefas));

  @override
  String toString() {
    return 'User(id: $id, email: $email, nomeUsuario: $nomeUsuario, senha: $senha, tarefas: $tarefas)';
  }
}

/// @nodoc
abstract mixin class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) _then) =
      _$UserCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String email,
      String nomeUsuario,
      String senha,
      List<Task> tarefas});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? nomeUsuario = null,
    Object? senha = null,
    Object? tarefas = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nomeUsuario: null == nomeUsuario
          ? _self.nomeUsuario
          : nomeUsuario // ignore: cast_nullable_to_non_nullable
              as String,
      senha: null == senha
          ? _self.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as String,
      tarefas: null == tarefas
          ? _self.tarefas
          : tarefas // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _User implements User {
  const _User(
      {required this.id,
      required this.email,
      required this.nomeUsuario,
      required this.senha,
      required final List<Task> tarefas})
      : _tarefas = tarefas;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String nomeUsuario;
  @override
  final String senha;
  final List<Task> _tarefas;
  @override
  List<Task> get tarefas {
    if (_tarefas is EqualUnmodifiableListView) return _tarefas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tarefas);
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.nomeUsuario, nomeUsuario) ||
                other.nomeUsuario == nomeUsuario) &&
            (identical(other.senha, senha) || other.senha == senha) &&
            const DeepCollectionEquality().equals(other._tarefas, _tarefas));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, nomeUsuario, senha,
      const DeepCollectionEquality().hash(_tarefas));

  @override
  String toString() {
    return 'User(id: $id, email: $email, nomeUsuario: $nomeUsuario, senha: $senha, tarefas: $tarefas)';
  }
}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) =
      __$UserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      String nomeUsuario,
      String senha,
      List<Task> tarefas});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? nomeUsuario = null,
    Object? senha = null,
    Object? tarefas = null,
  }) {
    return _then(_User(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      nomeUsuario: null == nomeUsuario
          ? _self.nomeUsuario
          : nomeUsuario // ignore: cast_nullable_to_non_nullable
              as String,
      senha: null == senha
          ? _self.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as String,
      tarefas: null == tarefas
          ? _self._tarefas
          : tarefas // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

// dart format on
