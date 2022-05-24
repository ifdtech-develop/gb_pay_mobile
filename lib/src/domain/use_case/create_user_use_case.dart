import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:gb_pay_mobile/src/data/model/user_model.dart';
import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';
import 'package:gb_pay_mobile/src/domain/repository/user_repository.dart';
import 'package:gb_pay_mobile/src/util/constants.dart';

import 'package:http/http.dart' as http;

abstract class CreateUserUseCase {
  Future<Either<Exception, UserEntity>> call(UserEntity user);
}

class CreateUser implements CreateUserUseCase {
  final UserRepository repository;

  const CreateUser({
    required this.repository,
  });

  @override
  Future<Either<Exception, UserEntity>> call(UserEntity user) async {
    try {
      String bday = user.birthDay.substring(6, 10) +
          '-' +
          user.birthDay.substring(3, 5) +
          '-' +
          user.birthDay.substring(0, 2);
      print('birthday: $bday');
      print('name: ${user.name}');
      print('email: ${user.email}');
      print('identity: ${user.cpf}');
      print('phone: ${user.tell}');
      print('document: ${user.rg}');
      //realizar criação do usuário online
      //realizar criação do usuário online
      print('enviando requisição');
      final response = await http.post(Uri.parse('${kServerURL}/users'),
          body: json.encode({
            "name": user.name,
            "email": user.email,
            "password": user.password,
            "birthDay": bday,
            "rg": null,
            "tell": user.tell,
            "cpf": null,
            "validated": true,
            "averageRating": 10,
            "statusUser": 1,
            "isLead": true,
            "urlLatter": "https://google.com",
            "urlLinkedin": "https://google.com",
            "tipo": 1
          }),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });
      print('enviou a requisicao');
      print(user.toString());
      //await repository.createUser(UserModel.fromEntity(user));

      if (response.statusCode == 200) {
        print('sucesso?');
        return Right(user);
      } else {
        print('problema ${response.statusCode} com retorno: ${response.body}');
        return Left(Exception(
            'Failed to create user, status-code: ${response.statusCode}'));
      }
    } catch (e) {
      print('erro ao criar usuário $e ');
      return Left(Exception('Failed to create user'));
    }
  }
}
