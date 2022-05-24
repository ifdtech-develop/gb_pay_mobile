// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'postagem_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostagemModel _$PostagemModelFromJson(Map<String, dynamic> json) {
  return _PostagemModel.fromJson(json);
}

/// @nodoc
class _$PostagemModelTearOff {
  const _$PostagemModelTearOff();

  _PostagemModel call(
      {required String hora,
      required String data,
      required String texto,
      required String tipo,
      required String status,
      required int idMensagem,
      required UsuarioModel usuarioId}) {
    return _PostagemModel(
      hora: hora,
      data: data,
      texto: texto,
      tipo: tipo,
      status: status,
      idMensagem: idMensagem,
      usuarioId: usuarioId,
    );
  }

  PostagemModel fromJson(Map<String, Object?> json) {
    return PostagemModel.fromJson(json);
  }
}

/// @nodoc
const $PostagemModel = _$PostagemModelTearOff();

/// @nodoc
mixin _$PostagemModel {
  String get hora => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;
  String get texto => throw _privateConstructorUsedError;
  String get tipo => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get idMensagem => throw _privateConstructorUsedError;
  UsuarioModel get usuarioId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostagemModelCopyWith<PostagemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostagemModelCopyWith<$Res> {
  factory $PostagemModelCopyWith(
          PostagemModel value, $Res Function(PostagemModel) then) =
      _$PostagemModelCopyWithImpl<$Res>;
  $Res call(
      {String hora,
      String data,
      String texto,
      String tipo,
      String status,
      int idMensagem,
      UsuarioModel usuarioId});

  $UsuarioModelCopyWith<$Res> get usuarioId;
}

/// @nodoc
class _$PostagemModelCopyWithImpl<$Res>
    implements $PostagemModelCopyWith<$Res> {
  _$PostagemModelCopyWithImpl(this._value, this._then);

  final PostagemModel _value;
  // ignore: unused_field
  final $Res Function(PostagemModel) _then;

  @override
  $Res call({
    Object? hora = freezed,
    Object? data = freezed,
    Object? texto = freezed,
    Object? tipo = freezed,
    Object? status = freezed,
    Object? idMensagem = freezed,
    Object? usuarioId = freezed,
  }) {
    return _then(_value.copyWith(
      hora: hora == freezed
          ? _value.hora
          : hora // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      texto: texto == freezed
          ? _value.texto
          : texto // ignore: cast_nullable_to_non_nullable
              as String,
      tipo: tipo == freezed
          ? _value.tipo
          : tipo // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      idMensagem: idMensagem == freezed
          ? _value.idMensagem
          : idMensagem // ignore: cast_nullable_to_non_nullable
              as int,
      usuarioId: usuarioId == freezed
          ? _value.usuarioId
          : usuarioId // ignore: cast_nullable_to_non_nullable
              as UsuarioModel,
    ));
  }

  @override
  $UsuarioModelCopyWith<$Res> get usuarioId {
    return $UsuarioModelCopyWith<$Res>(_value.usuarioId, (value) {
      return _then(_value.copyWith(usuarioId: value));
    });
  }
}

/// @nodoc
abstract class _$PostagemModelCopyWith<$Res>
    implements $PostagemModelCopyWith<$Res> {
  factory _$PostagemModelCopyWith(
          _PostagemModel value, $Res Function(_PostagemModel) then) =
      __$PostagemModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String hora,
      String data,
      String texto,
      String tipo,
      String status,
      int idMensagem,
      UsuarioModel usuarioId});

  @override
  $UsuarioModelCopyWith<$Res> get usuarioId;
}

/// @nodoc
class __$PostagemModelCopyWithImpl<$Res>
    extends _$PostagemModelCopyWithImpl<$Res>
    implements _$PostagemModelCopyWith<$Res> {
  __$PostagemModelCopyWithImpl(
      _PostagemModel _value, $Res Function(_PostagemModel) _then)
      : super(_value, (v) => _then(v as _PostagemModel));

  @override
  _PostagemModel get _value => super._value as _PostagemModel;

  @override
  $Res call({
    Object? hora = freezed,
    Object? data = freezed,
    Object? texto = freezed,
    Object? tipo = freezed,
    Object? status = freezed,
    Object? idMensagem = freezed,
    Object? usuarioId = freezed,
  }) {
    return _then(_PostagemModel(
      hora: hora == freezed
          ? _value.hora
          : hora // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      texto: texto == freezed
          ? _value.texto
          : texto // ignore: cast_nullable_to_non_nullable
              as String,
      tipo: tipo == freezed
          ? _value.tipo
          : tipo // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      idMensagem: idMensagem == freezed
          ? _value.idMensagem
          : idMensagem // ignore: cast_nullable_to_non_nullable
              as int,
      usuarioId: usuarioId == freezed
          ? _value.usuarioId
          : usuarioId // ignore: cast_nullable_to_non_nullable
              as UsuarioModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostagemModel implements _PostagemModel {
  _$_PostagemModel(
      {required this.hora,
      required this.data,
      required this.texto,
      required this.tipo,
      required this.status,
      required this.idMensagem,
      required this.usuarioId});

  factory _$_PostagemModel.fromJson(Map<String, dynamic> json) =>
      _$$_PostagemModelFromJson(json);

  @override
  final String hora;
  @override
  final String data;
  @override
  final String texto;
  @override
  final String tipo;
  @override
  final String status;
  @override
  final int idMensagem;
  @override
  final UsuarioModel usuarioId;

  @override
  String toString() {
    return 'PostagemModel(hora: $hora, data: $data, texto: $texto, tipo: $tipo, status: $status, idMensagem: $idMensagem, usuarioId: $usuarioId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostagemModel &&
            (identical(other.hora, hora) || other.hora == hora) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.texto, texto) || other.texto == texto) &&
            (identical(other.tipo, tipo) || other.tipo == tipo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.idMensagem, idMensagem) ||
                other.idMensagem == idMensagem) &&
            (identical(other.usuarioId, usuarioId) ||
                other.usuarioId == usuarioId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, hora, data, texto, tipo, status, idMensagem, usuarioId);

  @JsonKey(ignore: true)
  @override
  _$PostagemModelCopyWith<_PostagemModel> get copyWith =>
      __$PostagemModelCopyWithImpl<_PostagemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostagemModelToJson(this);
  }
}

abstract class _PostagemModel implements PostagemModel {
  factory _PostagemModel(
      {required String hora,
      required String data,
      required String texto,
      required String tipo,
      required String status,
      required int idMensagem,
      required UsuarioModel usuarioId}) = _$_PostagemModel;

  factory _PostagemModel.fromJson(Map<String, dynamic> json) =
      _$_PostagemModel.fromJson;

  @override
  String get hora;
  @override
  String get data;
  @override
  String get texto;
  @override
  String get tipo;
  @override
  String get status;
  @override
  int get idMensagem;
  @override
  UsuarioModel get usuarioId;
  @override
  @JsonKey(ignore: true)
  _$PostagemModelCopyWith<_PostagemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
