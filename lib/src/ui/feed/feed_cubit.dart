import 'package:gb_pay_mobile/src/data/dto/post_dto.dart';
import 'package:gb_pay_mobile/src/domain/entity/postagem_entity.dart';
import 'package:gb_pay_mobile/src/domain/use_case/mostrarfeed_use_case.dart';
import 'package:gb_pay_mobile/src/domain/use_case/realizarpostagem_use_case.dart';
import 'package:gb_pay_mobile/src/util/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_cubit.freezed.dart';

@freezed
class FeedState with _$FeedState {
  const factory FeedState({
    @Default('') String nome,
    @Default('') String token,
    @Default([]) List<PostagemEntity> postagens,
  }) = _FeedState;
}

class FeedCubit extends Cubit<FeedState> {
  final MostrarFeedUseCase mostrarFeed;
  final RealizarPostagemUseCase realizarPostagem;

  FeedCubit(this.mostrarFeed, this.realizarPostagem) : super(const FeedState());

  Future<void> atualizar() async {
    //Verificar se a lista está vazia.
    //Pega primeiro elemento da lista
    //envia mensagem pro servidor, request de feed com index 0
    //compara retorno do servidor com primeiro elemento da lista
    //é o mesmo? se sim não faz nada
    //é diferente? Adiciona em uma lista
    //  realiza comparação e busca no servidor até encontrar primeiro elemento da lista.
    //  quando encontrar interromper loop
    //  adicionar valores ao início da lista de postagens.
    if (!state.postagens.isEmpty) {
      PostagemEntity primeirapostagem = state.postagens.first;
      List<PostagemEntity> postagensadd = [];
      bool encontrado = false;
      bool erro = false;
      int index = 0;

      while (!encontrado) {
        final _result = await mostrarFeed(index);

        _result.fold(
          (l) => state.copyWith(),
          (r) {
            //postagensupdate = r;
            //percorre lista r a procura da primeira postagem.
            //encontrou a mensagem? pronto
            //não encontrou salva a mensagem de r numa lista separada.

            for (PostagemEntity p in r) {
              if (p.idMensagem == primeirapostagem.idMensagem) {
                //faz nada
                print(
                    'id da mensagem ${p.idMensagem} ${primeirapostagem.idMensagem} ');
                //tendo em mente que o último valor não é o fim do array no servidor;
                encontrado = true; //true
                break;
              } else {
                postagensadd.add(p);
              }
            }
            if (r.length == 0) {
              print("chegou ao final");
              encontrado = true;
            }
          },
        );

        if (!encontrado) {
          index++;
        }
      }
      postagensadd.addAll(state.postagens);
      emit(state.copyWith(postagens: postagensadd));
    } else {
      final _result = await mostrarFeed(0);
      emit(_result.fold(
        (l) => state.copyWith(),
        (r) => state.copyWith(postagens: r),
      ));
    }
  }

  //Aumentar Páginação, chamada quando o usuário chega embaixo.
  Future<void> aumentarPag() async {
    int index;
    bool encontrado = false;
    List<PostagemEntity> postagensatual = [];
    List<PostagemEntity> postagensupdate = [];
    List<PostagemEntity> postagensadd = [];

    postagensatual.addAll(state.postagens);
    index = (state.postagens.length / kPaginCount).floor() - 1;

    while (!encontrado) {
      final _result = await mostrarFeed(index);

      _result.fold(
        (l) => state.copyWith(),
        (r) async {
          //Faz verificação do valor retornado.
          postagensupdate = r;
          for (PostagemEntity p in postagensupdate) {
            if (encontrado) {
              postagensadd.add(p);
            } else if (p.idMensagem == postagensatual.last.idMensagem) {
              encontrado = true;
            }
          }

          if (encontrado) {
            if (postagensadd.length > 0) {
              postagensatual.addAll(postagensadd);
              emit(state.copyWith(postagens: postagensatual));
            } else {
              index++;
              final _result = await mostrarFeed(index);
              _result.fold(
                (l) => state.copyWith(),
                (r) {
                  postagensatual.addAll(r);
                  emit(state.copyWith(postagens: postagensatual));
                },
              );
            }
          } else {
            index++;
          }
        },
      );
    }
  }

  Future<void> setToken(String token) async {
    state.copyWith(token: token);
  }

  Future<void> postar(PostDto pdto) async {
    final _result = await realizarPostagem(pdto);
    _result.fold((l) => state.copyWith(), (r) => atualizar());
  }
}
