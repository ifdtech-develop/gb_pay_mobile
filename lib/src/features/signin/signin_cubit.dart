import 'package:gb_pay_mobile/src/data/dto/signin_dto.dart';
import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';
import 'package:gb_pay_mobile/src/domain/entity/usuario_entity.dart';
import 'package:gb_pay_mobile/src/domain/use_case/dadosusuario_use_case.dart';
import 'package:gb_pay_mobile/src/domain/use_case/signin_user_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_cubit.freezed.dart';

@freezed
class SigninState with _$SigninState {
  const factory SigninState({
    @Default('') String phone,
    String? phoneError,
    @Default('') String password,
    String? passwordError,
    @Default(true) obscruredPassword,
    @Default('') String token,
    @Default('') String ltoken,
    String? tokenError,
    @Default(false) loading,
    String? apiError,
    UserEntity? user,
  }) = _SigninState;
}

class SigninCubit extends Cubit<SigninState> {
  final SigninUserUseCase signinUser;
  final DadosUsuarioUseCase dadosUsuario;

  SigninCubit(
    this.signinUser,
    this.dadosUsuario,
  ) : super(const SigninState());

  Future<void> login() async {
    emit(state.copyWith(
      loading: true,
    ));

    final _user = await signinUser(
      SigninDto(
        phone: state.phone.replaceAll(RegExp(r'\D'), ''),
        password: state.password,
      ),
    );

    final _state = _user.fold(
      (l) => state.copyWith(apiError: l.toString()),
      (r) => state.copyWith(user: r),
    );
    /*
    String returntoken = "";
    _user.fold(
      (l) {},
      (r) {returntoken = r;},
    );

    final _userdata = await dadosUsuario(
      returntoken,
      state.phone.replaceAll(RegExp(r'\D'), '')
    );
    UserEntity usuario = new UserEntity(name: "", birthDay: "", email: "", tell: "", cpf: "", rg: "", password: "",token: "");
    _userdata.fold(
      (l) {},
      (r) {usuario = r;},
    );*/

    emit(_state.copyWith(loading: false));
  }

  void setPhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      emit(
        state.copyWith(
          phone: '',
          phoneError: 'phone obrigatório',
        ),
      );
      return;
    }

    emit(state.copyWith(
      phone: phone,
      phoneError: null,
    ));
  }

  void setPassword(String? password) {
    if (password == null || password.isEmpty) {
      emit(
        state.copyWith(
          password: '',
          passwordError: 'Senha obrigatória',
        ),
      );
      return;
    }

    emit(state.copyWith(
      password: password,
      passwordError: null,
    ));
  }
}
