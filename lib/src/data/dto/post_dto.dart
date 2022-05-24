import 'package:equatable/equatable.dart';

class PostDto extends Equatable {
  
  final String texto;
  final String tipo;
  final String status;
  PostDto({
    required this.texto,
    required this.tipo,
    required this.status,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>[
    texto,
    tipo,
    status
  ];

    
}
