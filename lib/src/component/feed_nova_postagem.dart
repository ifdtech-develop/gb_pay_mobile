import 'package:flutter/material.dart';

import '../data/dto/post_dto.dart';
import '../ui/feed/feed_cubit.dart';
import 'fennec_colorful_button.dart';

class FeedNovaPostagem extends StatelessWidget {
  FeedCubit cubit;
  String token;
  TextEditingController txtMensagem = new TextEditingController();

  FeedNovaPostagem({Key? key, required this.cubit, required this.token})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                "Tem algo a dizer?",
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF4d4d4d),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFF707070),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtMensagem,
                  minLines: 2, //Normal textInputField will be displayed
                  maxLines: 3, //
                  style: TextStyle(decoration: TextDecoration.none),
                  keyboardType: TextInputType
                      .multiline, // user keyboard will have a button to move cursor to next line
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(0),
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: "Compartilhe o que está pensando...",
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Aqui colocar a ação para o mesmo postar a atualização dele.
              FennecColorfulButton(
                  customOnPressed: () async {
                    PostDto post = PostDto(
                        texto: txtMensagem.text,
                        tipo: "texto",
                        status: "ativo");

                    txtMensagem.text = "";
                    //Postagem postagem = await fetchRealizaPostagem(post, "test");*/
                    //stateController.updateState();
                    cubit.realizarPostagem(post);
                  },
                  titulo: "Postar"),
            ],
          )
        ],
      ),
    );
  }
}
