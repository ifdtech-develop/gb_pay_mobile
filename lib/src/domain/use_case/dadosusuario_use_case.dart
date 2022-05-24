import 'package:dartz/dartz.dart';
import 'package:gb_pay_mobile/src/data/model/postagem/postagem_model.dart';
import 'package:gb_pay_mobile/src/data/model/user_model.dart';
import 'package:gb_pay_mobile/src/domain/entity/postagem_entity.dart';
import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';
import 'package:gb_pay_mobile/src/domain/repository/postagem_repository.dart';
import 'package:gb_pay_mobile/src/domain/repository/user_repository.dart';

abstract class DadosUsuarioUseCase {
  Future<Either<Exception, UserEntity>> call(String token, String tell);
}

class DadosUsuario implements DadosUsuarioUseCase {
  final UserRepository repository;

  const DadosUsuario({
    required this.repository,
  });

  @override
  Future<Either<Exception, UserEntity>> call(String token, String tell) async {
    try {
      UserEntity usuario =
          await repository.dadosUsuario(token, tell) as UserEntity;

      return Right(usuario);
    } catch (e) {
      return Left(Exception('Failed to create user'));
    }
  }
}
