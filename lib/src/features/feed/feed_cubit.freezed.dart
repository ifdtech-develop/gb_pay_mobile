// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'feed_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FeedStateTearOff {
  const _$FeedStateTearOff();

  _FeedState call(
      {String nome = '',
      String token = '',
      List<PostagemEntity> postagens = const []}) {
    return _FeedState(
      nome: nome,
      token: token,
      postagens: postagens,
    );
  }
}

/// @nodoc
const $FeedState = _$FeedStateTearOff();

/// @nodoc
mixin _$FeedState {
  String get nome => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  List<PostagemEntity> get postagens => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeedStateCopyWith<FeedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedStateCopyWith<$Res> {
  factory $FeedStateCopyWith(FeedState value, $Res Function(FeedState) then) =
      _$FeedStateCopyWithImpl<$Res>;
  $Res call({String nome, String token, List<PostagemEntity> postagens});
}

/// @nodoc
class _$FeedStateCopyWithImpl<$Res> implements $FeedStateCopyWith<$Res> {
  _$FeedStateCopyWithImpl(this._value, this._then);

  final FeedState _value;
  // ignore: unused_field
  final $Res Function(FeedState) _then;

  @override
  $Res call({
    Object? nome = freezed,
    Object? token = freezed,
    Object? postagens = freezed,
  }) {
    return _then(_value.copyWith(
      nome: nome == freezed
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      postagens: postagens == freezed
          ? _value.postagens
          : postagens // ignore: cast_nullable_to_non_nullable
              as List<PostagemEntity>,
    ));
  }
}

/// @nodoc
abstract class _$FeedStateCopyWith<$Res> implements $FeedStateCopyWith<$Res> {
  factory _$FeedStateCopyWith(
          _FeedState value, $Res Function(_FeedState) then) =
      __$FeedStateCopyWithImpl<$Res>;
  @override
  $Res call({String nome, String token, List<PostagemEntity> postagens});
}

/// @nodoc
class __$FeedStateCopyWithImpl<$Res> extends _$FeedStateCopyWithImpl<$Res>
    implements _$FeedStateCopyWith<$Res> {
  __$FeedStateCopyWithImpl(_FeedState _value, $Res Function(_FeedState) _then)
      : super(_value, (v) => _then(v as _FeedState));

  @override
  _FeedState get _value => super._value as _FeedState;

  @override
  $Res call({
    Object? nome = freezed,
    Object? token = freezed,
    Object? postagens = freezed,
  }) {
    return _then(_FeedState(
      nome: nome == freezed
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      postagens: postagens == freezed
          ? _value.postagens
          : postagens // ignore: cast_nullable_to_non_nullable
              as List<PostagemEntity>,
    ));
  }
}

/// @nodoc

class _$_FeedState with DiagnosticableTreeMixin implements _FeedState {
  const _$_FeedState(
      {this.nome = '', this.token = '', this.postagens = const []});

  @JsonKey(defaultValue: '')
  @override
  final String nome;
  @JsonKey(defaultValue: '')
  @override
  final String token;
  @JsonKey(defaultValue: const [])
  @override
  final List<PostagemEntity> postagens;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeedState(nome: $nome, token: $token, postagens: $postagens)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FeedState'))
      ..add(DiagnosticsProperty('nome', nome))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('postagens', postagens));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FeedState &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.token, token) || other.token == token) &&
            const DeepCollectionEquality().equals(other.postagens, postagens));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, nome, token, const DeepCollectionEquality().hash(postagens));

  @JsonKey(ignore: true)
  @override
  _$FeedStateCopyWith<_FeedState> get copyWith =>
      __$FeedStateCopyWithImpl<_FeedState>(this, _$identity);
}

abstract class _FeedState implements FeedState {
  const factory _FeedState(
      {String nome,
      String token,
      List<PostagemEntity> postagens}) = _$_FeedState;

  @override
  String get nome;
  @override
  String get token;
  @override
  List<PostagemEntity> get postagens;
  @override
  @JsonKey(ignore: true)
  _$FeedStateCopyWith<_FeedState> get copyWith =>
      throw _privateConstructorUsedError;
}
