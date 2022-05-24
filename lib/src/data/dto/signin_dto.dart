import 'package:equatable/equatable.dart';

class SigninDto extends Equatable {
  final String phone;
  final String password;

  const SigninDto({
    required this.phone,
    required this.password,
  });

  @override
  List<Object> get props => [
        phone,
        password,
      ];
}
