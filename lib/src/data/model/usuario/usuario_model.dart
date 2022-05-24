import 'package:gb_pay_mobile/src/domain/entity/usuario_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usuario_model.freezed.dart';
part 'usuario_model.g.dart';

@JsonSerializable()
@freezed
class UsuarioModel with _$UsuarioModel {
  factory UsuarioModel({
    required int id,
    required String name,
  }) = _UsuarioModel;

  factory UsuarioModel.fromJson(Map<String, dynamic> json) =>
      _$UsuarioModelFromJson(json);

  factory UsuarioModel.fromEntity(UsuarioEntity user) => UsuarioModel(
        id: user.id,
        name: user.name,
      );
}
