import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:gb_pay_mobile/src/data/model/postagem/postagem_model.dart';
import 'package:gb_pay_mobile/src/domain/entity/usuario_entity.dart';

class PostagemEntity extends Equatable {
  const PostagemEntity(
      {required this.hora,
      required this.data,
      required this.texto,
      required this.tipo,
      required this.status,
      required this.idMensagem,
      required this.usuarioId});

  final String hora;
  final String data;
  final String texto;
  final String tipo;
  final String status;
  final int idMensagem;
  final UsuarioEntity usuarioId;

  factory PostagemEntity.fromModel(PostagemModel model) => PostagemEntity(
      hora: model.hora,
      data: model.data,
      texto: model.texto,
      tipo: model.tipo,
      status: model.status,
      idMensagem: model.idMensagem,
      usuarioId: UsuarioEntity.fromModel(model.usuarioId));

  PostagemEntity copyWith({
    String? hora,
    String? data,
    String? texto,
    String? tipo,
    String? status,
    int? idMensagem,
    UsuarioEntity? usuarioId,
  }) {
    return PostagemEntity(
      hora: hora ?? this.hora,
      data: data ?? this.data,
      texto: texto ?? this.texto,
      tipo: tipo ?? this.tipo,
      status: status ?? this.status,
      idMensagem: idMensagem ?? this.idMensagem,
      usuarioId: usuarioId ?? this.usuarioId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hora': hora,
      'data': data,
      'texto': texto,
      'tipo': tipo,
      'status': status,
      'idMensagem': idMensagem,
      'usuarioId': usuarioId.toMap(),
    };
  }

  factory PostagemEntity.fromMap(Map<String, dynamic> map) {
    return PostagemEntity(
      hora: map['hora'] ?? '',
      data: map['data'] ?? '',
      texto: map['texto'] ?? '',
      tipo: map['tipo'] ?? '',
      status: map['status'] ?? '',
      idMensagem: map['idMensagem']?.toInt() ?? 0,
      usuarioId: UsuarioEntity.fromMap(map['usuarioId']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostagemEntity.fromJson(String source) =>
      PostagemEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostagemEntity(hora: $hora, data: $data, texto: $texto, tipo: $tipo, status: $status, idMensagem: $idMensagem, usuarioId: $usuarioId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostagemEntity &&
        other.hora == hora &&
        other.data == data &&
        other.texto == texto &&
        other.tipo == tipo &&
        other.status == status &&
        other.idMensagem == idMensagem;
  }

  @override
  int get hashCode {
    return hora.hashCode ^
        data.hashCode ^
        texto.hashCode ^
        tipo.hashCode ^
        status.hashCode ^
        idMensagem.hashCode;
  }

  @override
  // TODO: implement props
  List<Object> get props {
    return [
      hora,
      data,
      texto,
      tipo,
      status,
      idMensagem,
      usuarioId,
    ];
  }
}
