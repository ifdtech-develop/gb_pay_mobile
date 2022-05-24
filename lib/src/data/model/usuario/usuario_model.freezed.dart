// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'usuario_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UsuarioModel _$UsuarioModelFromJson(Map<String, dynamic> json) {
  return _UsuarioModel.fromJson(json);
}

/// @nodoc
class _$UsuarioModelTearOff {
  const _$UsuarioModelTearOff();

  _UsuarioModel call({required int id, required String name}) {
    return _UsuarioModel(
      id: id,
      name: name,
    );
  }

  UsuarioModel fromJson(Map<String, Object?> json) {
    return UsuarioModel.fromJson(json);
  }
}

/// @nodoc
const $UsuarioModel = _$UsuarioModelTearOff();

/// @nodoc
mixin _$UsuarioModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsuarioModelCopyWith<UsuarioModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsuarioModelCopyWith<$Res> {
  factory $UsuarioModelCopyWith(
          UsuarioModel value, $Res Function(UsuarioModel) then) =
      _$UsuarioModelCopyWithImpl<$Res>;
  $Res call({int id, String name});
}

/// @nodoc
class _$UsuarioModelCopyWithImpl<$Res> implements $UsuarioModelCopyWith<$Res> {
  _$UsuarioModelCopyWithImpl(this._value, this._then);

  final UsuarioModel _value;
  // ignore: unused_field
  final $Res Function(UsuarioModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UsuarioModelCopyWith<$Res>
    implements $UsuarioModelCopyWith<$Res> {
  factory _$UsuarioModelCopyWith(
          _UsuarioModel value, $Res Function(_UsuarioModel) then) =
      __$UsuarioModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name});
}

/// @nodoc
class __$UsuarioModelCopyWithImpl<$Res> extends _$UsuarioModelCopyWithImpl<$Res>
    implements _$UsuarioModelCopyWith<$Res> {
  __$UsuarioModelCopyWithImpl(
      _UsuarioModel _value, $Res Function(_UsuarioModel) _then)
      : super(_value, (v) => _then(v as _UsuarioModel));

  @override
  _UsuarioModel get _value => super._value as _UsuarioModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_UsuarioModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UsuarioModel implements _UsuarioModel {
  _$_UsuarioModel({required this.id, required this.name});

  factory _$_UsuarioModel.fromJson(Map<String, dynamic> json) =>
      _$$_UsuarioModelFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'UsuarioModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UsuarioModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  _$UsuarioModelCopyWith<_UsuarioModel> get copyWith =>
      __$UsuarioModelCopyWithImpl<_UsuarioModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsuarioModelToJson(this);
  }
}

abstract class _UsuarioModel implements UsuarioModel {
  factory _UsuarioModel({required int id, required String name}) =
      _$_UsuarioModel;

  factory _UsuarioModel.fromJson(Map<String, dynamic> json) =
      _$_UsuarioModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$UsuarioModelCopyWith<_UsuarioModel> get copyWith =>
      throw _privateConstructorUsedError;
}
