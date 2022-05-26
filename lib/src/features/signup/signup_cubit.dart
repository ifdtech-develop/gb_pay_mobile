import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';
import 'package:gb_pay_mobile/src/domain/use_case/create_user_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gb_pay_mobile/src/features/signup/util_date.dart';

part 'signup_cubit.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState({
    @Default(false) bool loading,
    @Default('') String name,
    String? nameError,
    @Default('') String birthDate,
    String? birthDateError,
    @Default('') String email,
    String? emailError,
    @Default('') String phone,
    String? phoneError,
    @Default('') String identity,
    String? identityError,
    @Default('') String document,
    String? documentError,
    @Default('') String password,
    String? passwordError,
    @Default('') String confirmPassword,
    String? confirmPasswordError,
    @Default(true) obscuredPassword,
    @Default(true) obscuredConfirmPassword,
    UserEntity? user,
    String? apiError,
  }) = _SignupState;
}

class SignupCubit extends Cubit<SignupState> {
  final CreateUserUseCase createUser;

  SignupCubit(
    this.createUser,
  ) : super(const SignupState());

  Future<void> signupUser() async {
    emit(state.copyWith(loading: true));

    final user = UserEntity(
      name: state.name,
      birthDay: state.birthDate,
      email: state.email,
      tell: state.phone.replaceAll(RegExp(r'\D'), ''),
      cpf: state.identity.replaceAll(RegExp(r'\D'), ''),
      rg: state.document.replaceAll(RegExp(r'\D'), ''),
      password: state.password,
      token: "",
      jwtoken: "",
    );
    print('montou o usuario');
    final _result = await createUser(user);

    emit(
      _result
          .fold(
            (l) => state,
            (r) => state.copyWith(
              user: r,
            ),
          )
          .copyWith(
            loading: false,
          ),
    );
  }

  void setName(String? name) {
    if (name == null || name.trim().isEmpty) {
      emit(
        state.copyWith(
          name: '',
          nameError: 'Nome obrigatório',
        ),
      );
      return;
    }

    emit(state.copyWith(
      name: name,
      nameError: null,
    ));
  }

  void setBirthDate(String? birthDate) {
    if (birthDate == null ||
        birthDate.trim().isEmpty ||
        isBirthDateValid(birthDate)) {
      emit(
        state.copyWith(
          birthDate: '',
          birthDateError: 'Data obrigatória',
        ),
      );
      return;
    }

    emit(state.copyWith(
      birthDate: birthDate,
      birthDateError: null,
    ));
  }

  void setEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      emit(
        state.copyWith(
          email: '',
          emailError: 'Email obrigatório',
        ),
      );
      return;
    }

    emit(state.copyWith(
      email: email,
      emailError: null,
    ));
  }

  void setPhone(String? phone) {
    if (phone == null || phone.trim().isEmpty) {
      emit(
        state.copyWith(
          phone: '',
          phoneError: 'Telefone obrigatório',
        ),
      );
      return;
    }

    emit(state.copyWith(
      phone: phone,
      phoneError: null,
    ));
  }

  void setIdentity(String? identity) {
    if (identity == null || identity.trim().isEmpty) {
      emit(
        state.copyWith(
          identity: '',
          identityError: 'Identidade obrigatória',
        ),
      );
      return;
    }

    emit(state.copyWith(
      identity: identity,
      identityError: null,
    ));
  }

  void setDocument(String? document) {
    if (document == null || document.trim().isEmpty) {
      emit(
        state.copyWith(
          document: '',
          documentError: 'CPF obrigatório',
        ),
      );
      return;
    }

    emit(state.copyWith(
      document: document,
      documentError: null,
    ));
  }

  void setPassword(String? password) {
    if (password == null || password.trim().isEmpty) {
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

  void setConfirmPassword(String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.trim().isEmpty) {
      emit(
        state.copyWith(
          confirmPassword: '',
          confirmPasswordError: 'Senha obrigatória',
        ),
      );
      return;
    }
    if (confirmPassword != state.password) {
      emit(
        state.copyWith(
          confirmPassword: '',
          confirmPasswordError: 'Senha deve ser a mesma',
        ),
      );
      return;
    }

    emit(state.copyWith(
      confirmPassword: confirmPassword,
      confirmPasswordError: null,
    ));
  }

  bool get hasError =>
      (state.name.trim().isEmpty || state.nameError != null) ||
      (state.birthDate.trim().isEmpty || state.birthDateError != null) ||
      (state.email.trim().isEmpty || state.emailError != null) ||
      (state.phone.trim().isEmpty || state.phoneError != null) ||
      (state.identity.trim().isEmpty || state.identityError != null) ||
      (state.document.trim().isEmpty || state.documentError != null) ||
      (state.password.trim().isEmpty || state.passwordError != null) ||
      (state.confirmPassword.trim().isEmpty ||
          state.confirmPasswordError != null);
}
