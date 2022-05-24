import 'dart:convert';

import 'package:gb_pay_mobile/src/constants/single.dart';
import 'package:gb_pay_mobile/src/data/data_source/remote/remote_data_source.dart';
import 'package:gb_pay_mobile/src/data/model/user_model.dart';
import 'package:gb_pay_mobile/src/data/dto/signin_dto.dart';
import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';
import 'package:gb_pay_mobile/src/service/local_storage_service.dart';
import 'package:gb_pay_mobile/src/util/constants.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class AppRemoteDataSource implements RemoteDataSource {
  final LocalStorageService storage;
  var s = Singleton;
  AppRemoteDataSource({
    required this.storage,
  });

  @override
  Future<void> createUser(UserModel user) async {
    final phone = user.tell;

    storage.put(phone, user.toJson());
  }

  @override
  Future<UserModel?> signinUser(SigninDto dto) async {
    /*final key = dto.phone;

    final json = storage.get(key);

    final user = UserModel.fromJson(json);

    if (user.password == dto.password) {
      return user;
    }*/
    try {
      final response = await http.post(Uri.parse(kServerURL + '/login'),
          body: json.encode({"tell": dto.phone, "senha": dto.password}),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });
      if (response.statusCode == 200) {
        String tk = jsonDecode(response.body)['Token'];
        String nome = jsonDecode((utf8.decode(response.bodyBytes)))["nome"];
        String email = jsonDecode((utf8.decode(response.bodyBytes)))["email"];
        String token = jsonDecode((utf8.decode(response.bodyBytes)))["Token"];
        UserEntity usuario = new UserEntity(
            name: nome,
            birthDay: "",
            email: "",
            tell: "",
            cpf: "",
            rg: "",
            password: "",
            jwtoken: token,
            token: "");
        print('req bem sucedida $tk');

        s.jwtoken = token;
        s.nome = nome;
        s.email = email;
        storage.put("usuario", UserModel.fromEntity(usuario).toJson());

        return UserModel.fromEntity(usuario);
      } else {
        print('erro ${response.statusCode == 200}');
        throw Exception(
            'Failed to create user, status-code: ${response.statusCode}');
      }
      //return Left(Exception('User not found'));
    } catch (e) {
      print('erro $e');
      throw Exception('Something went wrong');
    }
  }

  @override
  Future<UserEntity?> dadosUsuario(String token, String tell) async {
    // TODO: implement dadosUsuario
    try {
      final response = await http
          .get(Uri.parse(kServerURL + '/users/tell/' + tell), headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "Authorization": token
      });

      if (response.statusCode == 200) {
        String nome = jsonDecode((utf8.decode(response.bodyBytes)))["name"];
        String token = jsonDecode((utf8.decode(response.bodyBytes)))["token"];
        UserEntity usuario = new UserEntity(
            name: nome,
            birthDay: "",
            email: "",
            tell: "",
            cpf: "",
            rg: "",
            password: "",
            jwtoken: token,
            token: "");

        return usuario;
      } else {
        print('problema ${response.statusCode} com retorno: ${response.body}');
        throw Exception(
            'Falha ao criar usuário, status-code: ${response.statusCode}');
      }
    } catch (e) {
      print('erro ao mostrar feed $e ');
      throw Exception('Falha ao criar usuário');
    }
  }
}
