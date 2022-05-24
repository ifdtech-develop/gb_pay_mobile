import 'package:gb_pay_mobile/src/data/data_source/local/local_data_source.dart';
import 'package:gb_pay_mobile/src/data/data_source/remote/remote_data_source.dart';
import 'package:gb_pay_mobile/src/data/model/user_model.dart';
import 'package:gb_pay_mobile/src/data/dto/signin_dto.dart';
import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';
import 'package:gb_pay_mobile/src/domain/repository/user_repository.dart';

class AppUserRepository implements UserRepository {
  final RemoteDataSource dataSource;
  final LocalDataSource ldataSource;

  AppUserRepository({
    required this.dataSource,
    required this.ldataSource,
  });

  @override
  Future<void> createUser(UserModel user) => dataSource.createUser(user);

  @override
  Future<UserModel?> signinUser(SigninDto dto) => dataSource.signinUser(dto);

  @override
  Future<UserEntity?> dadosUsuario(String token, String tell) =>
      dataSource.dadosUsuario(token, tell);

  @override
  Future<UserModel?> deviceUser() => ldataSource.deviceUser();
}
