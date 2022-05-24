import 'dart:async';

import 'package:gb_pay_mobile/src/constants/single.dart';
import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';
import 'package:gb_pay_mobile/src/domain/use_case/device_user_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_cubit.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    @Default(false) shouldRedirect,
    UserEntity? user,
  }) = _SplashState;
}

class SplashCubit extends Cubit<SplashState> {
  final DeviceUserUseCase deviceUser;
  var s = Singleton;

  SplashCubit(this.deviceUser) : super(const SplashState()) {
    Timer(const Duration(seconds: 3), () async {
      final _user = await deviceUser();
      emit(_user.fold((l) => state.copyWith(shouldRedirect: true), (r) {
        s.jwtoken = r.jwtoken;
        s.nome = r.name;
        return state.copyWith(user: r, shouldRedirect: true);
      }));
      //emit(state.copyWith(shouldRedirect: true,));
    });
  }
}
