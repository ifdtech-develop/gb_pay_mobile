// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'splash_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SplashStateTearOff {
  const _$SplashStateTearOff();

  _SplashState call(
      {dynamic shouldRedirect = false,
      dynamic fExec = true,
      UserEntity? user}) {
    return _SplashState(
      shouldRedirect: shouldRedirect,
      fExec: fExec,
      user: user,
    );
  }
}

/// @nodoc
const $SplashState = _$SplashStateTearOff();

/// @nodoc
mixin _$SplashState {
  dynamic get shouldRedirect => throw _privateConstructorUsedError;
  dynamic get fExec => throw _privateConstructorUsedError;
  UserEntity? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SplashStateCopyWith<SplashState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashStateCopyWith<$Res> {
  factory $SplashStateCopyWith(
          SplashState value, $Res Function(SplashState) then) =
      _$SplashStateCopyWithImpl<$Res>;
  $Res call({dynamic shouldRedirect, dynamic fExec, UserEntity? user});
}

/// @nodoc
class _$SplashStateCopyWithImpl<$Res> implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._value, this._then);

  final SplashState _value;
  // ignore: unused_field
  final $Res Function(SplashState) _then;

  @override
  $Res call({
    Object? shouldRedirect = freezed,
    Object? fExec = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      shouldRedirect: shouldRedirect == freezed
          ? _value.shouldRedirect
          : shouldRedirect // ignore: cast_nullable_to_non_nullable
              as dynamic,
      fExec: fExec == freezed
          ? _value.fExec
          : fExec // ignore: cast_nullable_to_non_nullable
              as dynamic,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
    ));
  }
}

/// @nodoc
abstract class _$SplashStateCopyWith<$Res>
    implements $SplashStateCopyWith<$Res> {
  factory _$SplashStateCopyWith(
          _SplashState value, $Res Function(_SplashState) then) =
      __$SplashStateCopyWithImpl<$Res>;
  @override
  $Res call({dynamic shouldRedirect, dynamic fExec, UserEntity? user});
}

/// @nodoc
class __$SplashStateCopyWithImpl<$Res> extends _$SplashStateCopyWithImpl<$Res>
    implements _$SplashStateCopyWith<$Res> {
  __$SplashStateCopyWithImpl(
      _SplashState _value, $Res Function(_SplashState) _then)
      : super(_value, (v) => _then(v as _SplashState));

  @override
  _SplashState get _value => super._value as _SplashState;

  @override
  $Res call({
    Object? shouldRedirect = freezed,
    Object? fExec = freezed,
    Object? user = freezed,
  }) {
    return _then(_SplashState(
      shouldRedirect:
          shouldRedirect == freezed ? _value.shouldRedirect : shouldRedirect,
      fExec: fExec == freezed ? _value.fExec : fExec,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
    ));
  }
}

/// @nodoc

class _$_SplashState implements _SplashState {
  const _$_SplashState(
      {this.shouldRedirect = false, this.fExec = true, this.user});

  @JsonKey(defaultValue: false)
  @override
  final dynamic shouldRedirect;
  @JsonKey(defaultValue: true)
  @override
  final dynamic fExec;
  @override
  final UserEntity? user;

  @override
  String toString() {
    return 'SplashState(shouldRedirect: $shouldRedirect, fExec: $fExec, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SplashState &&
            const DeepCollectionEquality()
                .equals(other.shouldRedirect, shouldRedirect) &&
            const DeepCollectionEquality().equals(other.fExec, fExec) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(shouldRedirect),
      const DeepCollectionEquality().hash(fExec),
      user);

  @JsonKey(ignore: true)
  @override
  _$SplashStateCopyWith<_SplashState> get copyWith =>
      __$SplashStateCopyWithImpl<_SplashState>(this, _$identity);
}

abstract class _SplashState implements SplashState {
  const factory _SplashState(
      {dynamic shouldRedirect,
      dynamic fExec,
      UserEntity? user}) = _$_SplashState;

  @override
  dynamic get shouldRedirect;
  @override
  dynamic get fExec;
  @override
  UserEntity? get user;
  @override
  @JsonKey(ignore: true)
  _$SplashStateCopyWith<_SplashState> get copyWith =>
      throw _privateConstructorUsedError;
}
