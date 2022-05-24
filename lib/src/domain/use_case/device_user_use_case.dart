import 'package:dartz/dartz.dart';
import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';
import 'package:gb_pay_mobile/src/domain/repository/user_repository.dart';

abstract class DeviceUserUseCase {
  Future<Either<Exception, UserEntity>> call();
}

class DeviceUser implements DeviceUserUseCase {
  final UserRepository repository;

  const DeviceUser({
    required this.repository,
  });

  @override
  Future<Either<Exception, UserEntity>> call() async {
    try {
      final user = await repository.deviceUser();
      if (user != null) {
        return Right(UserEntity.fromModel(user));
      } else {
        return Left(Exception('User not found'));
      }
    } catch (e) {
      return Left(Exception('User not found'));
    }
  }
}
