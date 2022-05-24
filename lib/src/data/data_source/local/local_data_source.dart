import 'package:gb_pay_mobile/src/data/model/user_model.dart';

abstract class LocalDataSource {
  Future<UserModel?> deviceUser();
}
