import 'package:dartz/dartz.dart';
import 'package:gb_pay_mobile/src/data/dto/signin_dto.dart';
import 'package:gb_pay_mobile/src/data/model/user_model.dart';
import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';
import 'package:gb_pay_mobile/src/domain/repository/user_repository.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class SigninUserUseCase {
  Future<Either<Exception, UserEntity>> call(SigninDto dto);
}

class SigninUser implements SigninUserUseCase {
  final UserRepository repository;

  const SigninUser({
    required this.repository,
  });

  @override
  Future<Either<Exception, UserEntity>> call(SigninDto dto) async {
    final user = await repository.signinUser(dto);
    if (user != null) {
      return Right(UserEntity.fromModel(user));
    } else {
      return Left(Exception('User not found'));
    }
  }
}
