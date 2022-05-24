import 'package:gb_pay_mobile/src/data/data_source/local/local_data_source.dart';
import 'package:gb_pay_mobile/src/data/model/user_model.dart';
import 'package:gb_pay_mobile/src/service/local_storage_service.dart';

class AppLocalDataSource implements LocalDataSource {
  final LocalStorageService storage;

  AppLocalDataSource({
    required this.storage,
  });

  @override
  Future<UserModel?> deviceUser() async {
    try {
      final json = storage.get("usuario");

      final user = await UserModel.fromJson(json);
      if (user != null) {
        print("Usuario Recuperado");
        //print(user.toJson());
        return user;
      } else {
        print("ele não conseguiu recuperar o usuário");
        throw Exception('Usuário não foi recuperado com sucesso');
        //return UserModel(name: "", birthDay: "", email: "", tell: "", cpf: "", rg: "", password: "", token: "", jwtoken: "");
      }
    } catch (e) {
      print("ele não conseguiu recuperar o usuário $e");
      throw Exception('Problema ao buscar dados $e');
    }
  }
}
