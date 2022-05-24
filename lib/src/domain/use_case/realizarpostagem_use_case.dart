import 'package:dartz/dartz.dart';
import 'package:gb_pay_mobile/src/data/dto/post_dto.dart';
import 'package:gb_pay_mobile/src/data/model/postagem/postagem_model.dart';
import 'package:gb_pay_mobile/src/data/model/user_model.dart';
import 'package:gb_pay_mobile/src/domain/entity/postagem_entity.dart';
import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';
import 'package:gb_pay_mobile/src/domain/repository/postagem_repository.dart';
import 'package:gb_pay_mobile/src/domain/repository/user_repository.dart';

abstract class RealizarPostagemUseCase {
  Future<Either<Exception, PostagemEntity>> call(PostDto pdto);
}

class RealizarPostagem implements RealizarPostagemUseCase {
  final PostagemRepository repository;

  const RealizarPostagem({
    required this.repository,
  });

  @override
  Future<Either<Exception, PostagemEntity>> call(PostDto pdto) async {
    try {
      PostagemEntity postagem = await repository.realizarPostagem(pdto);

      return Right(postagem);
    } catch (e) {
      return Left(Exception('Failed to create user'));
    }
  }
}
