// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postagem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************



Map<String, dynamic> _$PostagemModelToJson(PostagemModel instance) =>
    <String, dynamic>{
      'hora': instance.hora,
      'data': instance.data,
      'texto': instance.texto,
      'tipo': instance.tipo,
      'status': instance.status,
      'idMensagem': instance.idMensagem,
      'usuarioId': instance.usuarioId,
    };

_$_PostagemModel _$$_PostagemModelFromJson(Map<String, dynamic> json) =>
    _$_PostagemModel(
      hora: json['hora'] as String,
      data: json['data'] as String,
      texto: json['texto'] as String,
      tipo: json['tipo'] as String,
      status: json['status'] as String,
      idMensagem: json['idMensagem'] as int,
      usuarioId:
          UsuarioModel.fromJson(json['usuarioId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PostagemModelToJson(_$_PostagemModel instance) =>
    <String, dynamic>{
      'hora': instance.hora,
      'data': instance.data,
      'texto': instance.texto,
      'tipo': instance.tipo,
      'status': instance.status,
      'idMensagem': instance.idMensagem,
      'usuarioId': instance.usuarioId,
    };
