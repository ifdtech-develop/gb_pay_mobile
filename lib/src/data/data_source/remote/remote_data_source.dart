import 'package:gb_pay_mobile/src/data/dto/signin_dto.dart';
import 'package:gb_pay_mobile/src/data/model/user_model.dart';
import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';

abstract class RemoteDataSource {
  Future<void> createUser(UserModel user);

  Future<UserModel?> signinUser(SigninDto dto);

  Future<UserEntity?> dadosUsuario(String token, String tell);
}
