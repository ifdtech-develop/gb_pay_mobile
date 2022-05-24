import 'dart:convert';

import 'package:gb_pay_mobile/src/data/model/usuario/usuario_model.dart';

class UsuarioEntity {
  const UsuarioEntity({
    required this.name,
    required this.id,
  });

  final String name;
  final int id;

  factory UsuarioEntity.fromModel(UsuarioModel model) => UsuarioEntity(
        id: model.id,
        name: model.name,
      );

  UsuarioEntity copyWith({
    String? name,
    int? id,
  }) {
    return UsuarioEntity(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
    };
  }

  factory UsuarioEntity.fromMap(Map<String, dynamic> map) {
    return UsuarioEntity(
      name: map['name'] ?? '',
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioEntity.fromJson(String source) =>
      UsuarioEntity.fromMap(json.decode(source));

  @override
  String toString() => 'UsuarioEntity(name: $name, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UsuarioEntity && other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
