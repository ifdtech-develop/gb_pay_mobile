import 'package:gb_pay_mobile/src/data/data_source/remote/remote_data_source.dart';
import 'package:gb_pay_mobile/src/data/data_source/remote/remote_postagem_data_source.dart';
import 'package:gb_pay_mobile/src/data/dto/signin_dto.dart';
import 'package:gb_pay_mobile/src/data/model/postagem/postagem_model.dart';
import 'package:gb_pay_mobile/src/data/dto/post_dto.dart';
import 'package:gb_pay_mobile/src/data/model/user_model.dart';
import 'package:gb_pay_mobile/src/domain/entity/postagem_entity.dart';
import 'package:gb_pay_mobile/src/domain/repository/postagem_repository.dart';

class AppPostagemRepository implements PostagemRepository {
  final RemotePostagemDataSource dataSource;

  AppPostagemRepository({
    required this.dataSource,
  });

  /*
    @override
    Future<void> createUser(UserModel user) => dataSource.createUser(user);
  */

  /*
    @override
    Future<UserModel?> signinUser(SigninDto dto) => dataSource.signinUser(dto);
  */

  @override
  Future<List<PostagemEntity>?> mostrarFeed(int index) =>
      dataSource.mostrarFeed(index);

  @override
  Future<PostagemEntity> realizarPostagem(PostDto pdto) =>
      dataSource.realizarPostagem(pdto);
}
