import 'package:dartz/dartz.dart';
import 'package:gb_pay_mobile/src/constants/routes.dart';
import 'package:gb_pay_mobile/src/constants/single.dart';
import 'package:gb_pay_mobile/src/data/data_source/remote/remote_data_source.dart';
import 'package:gb_pay_mobile/src/data/data_source/remote/remote_postagem_data_source.dart';
import 'package:gb_pay_mobile/src/data/model/postagem/postagem_model.dart';
import 'package:gb_pay_mobile/src/data/dto/post_dto.dart';
import 'package:gb_pay_mobile/src/data/model/user_model.dart';
import 'package:gb_pay_mobile/src/data/dto/signin_dto.dart';
import 'package:gb_pay_mobile/src/data/model/usuario/usuario_model.dart';
import 'package:gb_pay_mobile/src/domain/entity/postagem_entity.dart';
import 'package:gb_pay_mobile/src/domain/entity/usuario_entity.dart';
import 'package:gb_pay_mobile/src/util/constants.dart';
import 'package:gb_pay_mobile/src/service/local_storage_service.dart';
import 'package:gb_pay_mobile/src/util/service_location.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class AppPostagemRemoteDataSource implements RemotePostagemDataSource {
  final LocalStorageService storage;
  var s = Singleton;

  AppPostagemRemoteDataSource({
    required this.storage,
  });

  @override
  Future<List<PostagemEntity>?> mostrarFeed(int index) async {
    try {
      final response = await http.get(
          Uri.parse(kServerURL +
              '/feed/pagination/' +
              index.toString() +
              '/' +
              kPaginCount.toString()),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": s.jwtoken
          });

      if (response.statusCode == 200) {
        //if (response.statusCode == 0) {

        List<PostagemEntity> postagens = [];

        for (dynamic d
            in (jsonDecode(utf8.decode(response.bodyBytes))["content"])) {
          //print(d['usuarioId']);
          //print(UsuarioEntity.fromJson(d['usuarioId']));
          postagens.add(PostagemEntity(
              hora: d['hora'],
              data: d['data'],
              texto: d['texto'],
              tipo: d['tipo'],
              status: d['status'],
              idMensagem: d['idMensagem'],
              usuarioId: (UsuarioEntity(
                  name: d['usuarioId']['name'], id: d['usuarioId']['id']))));
        }
        return postagens;
      } else if (response.statusCode == 403) {
        //}else if(response.statusCode==200){

        final NavigationService _navigationService =
            locator<NavigationService>();
        print("teste");
        _navigationService.navigateTo(AppRouteNames.greetings);
        _navigationService.showMyDialog(
            "Ops...", "talvez você precise fazer login novamente");
        throw Exception(
            'Falha ao criar usuário, status-code: ${response.statusCode}');
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

  @override
  Future<PostagemEntity> realizarPostagem(PostDto pdto) async {
    // TODO: implement realizarPostagem

    try {
      final response = await http.post(Uri.parse(kServerURL + '/feed/send'),
          body: jsonEncode(
              {"texto": pdto.texto, "tipo": pdto.tipo, "status": pdto.status}),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": s.jwtoken
          });

      if (response.statusCode == 200) {
        PostagemEntity postagem;

        dynamic d = jsonDecode(utf8.decode(response.bodyBytes));
        postagem = PostagemEntity(
            hora: d['hora'],
            data: d['data'],
            texto: d['texto'],
            tipo: d['tipo'],
            status: d['status'],
            idMensagem: d['idMensagem'],
            usuarioId: (UsuarioEntity(
                name: d['usuarioId']['name'], id: d['usuarioId']['id'])));

        return postagem;
      } else if (response.statusCode == 403) {
        //}else if(response.statusCode==200){

        final NavigationService _navigationService =
            locator<NavigationService>();

        _navigationService.navigateTo(AppRouteNames.greetings);
        _navigationService.showMyDialog(
            "Ops...", "talvez você precise fazer login novamente");
        throw Exception(
            'Falha ao criar usuário, status-code: ${response.statusCode}');
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
