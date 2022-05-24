import 'package:dartz/dartz.dart';
import 'package:gb_pay_mobile/src/data/model/postagem/postagem_model.dart';
import 'package:gb_pay_mobile/src/data/model/user_model.dart';
import 'package:gb_pay_mobile/src/domain/entity/postagem_entity.dart';
import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';
import 'package:gb_pay_mobile/src/domain/repository/postagem_repository.dart';
import 'package:gb_pay_mobile/src/domain/repository/user_repository.dart';

abstract class MostrarFeedUseCase {
  Future<Either<Exception, List<PostagemEntity>>> call(int index);
}

class MostrarFeed implements MostrarFeedUseCase {
  final PostagemRepository repository;

  const MostrarFeed({
    required this.repository,
  });

  @override
  Future<Either<Exception, List<PostagemEntity>>> call(int index) async {
    try {
      List<PostagemEntity> postagens =
          await repository.mostrarFeed(index) as List<PostagemEntity>;

      return Right(postagens);
    } catch (e) {
      return Left(Exception('Failed to create user'));
    }
  }
}
