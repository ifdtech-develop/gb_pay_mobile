import 'package:gb_pay_mobile/src/data/dto/post_dto.dart';
import 'package:gb_pay_mobile/src/data/dto/signin_dto.dart';
import 'package:gb_pay_mobile/src/data/model/postagem/postagem_model.dart';
import 'package:gb_pay_mobile/src/data/model/user_model.dart';
import 'package:gb_pay_mobile/src/domain/entity/postagem_entity.dart';

abstract class PostagemRepository {
  Future<PostagemEntity> realizarPostagem(PostDto pdto);

  Future<List<PostagemEntity>?> mostrarFeed(int index);
}
