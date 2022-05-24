import 'package:gb_pay_mobile/src/data/model/usuario/usuario_model.dart';
import 'package:gb_pay_mobile/src/domain/entity/postagem_entity.dart';
import 'package:gb_pay_mobile/src/domain/entity/usuario_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'postagem_model.freezed.dart';
part 'postagem_model.g.dart';

@JsonSerializable()
@freezed
class PostagemModel with _$PostagemModel {
  factory PostagemModel({
    required String hora,
    required String data,
    required String texto,
    required String tipo,
    required String status,
    required int idMensagem,
    required UsuarioModel usuarioId,
  }) = _PostagemModel;

  factory PostagemModel.fromJson(Map<String, dynamic> json) =>
      _$PostagemModelFromJson(json);

  factory PostagemModel.fromEntity(PostagemEntity postagem) => PostagemModel(
        data: postagem.data,
        hora: postagem.hora,
        idMensagem: postagem.idMensagem,
        status: postagem.status,
        texto: postagem.texto,
        tipo: postagem.tipo,
        usuarioId: UsuarioModel.fromEntity(postagem.usuarioId),
      );
}
