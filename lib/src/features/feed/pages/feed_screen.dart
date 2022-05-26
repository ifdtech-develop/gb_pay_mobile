import 'dart:async';
import 'dart:convert';

import 'package:gb_pay_mobile/src/component/feed_nova_postagem.dart';
import 'package:gb_pay_mobile/src/component/feed_postagem.dart';
import 'package:gb_pay_mobile/src/di/injector.dart';
import 'package:gb_pay_mobile/src/domain/entity/postagem_entity.dart';
import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';
import 'package:gb_pay_mobile/src/domain/entity/usuario_entity.dart';
import 'package:gb_pay_mobile/src/features/feed/feed_cubit.dart';
import 'package:gb_pay_mobile/src/util/assets.dart';
import 'package:gb_pay_mobile/src/util/constants.dart';
import 'package:gb_pay_mobile/src/util/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

final socketUrl = '${kServerURL}/wss';

class FeedScreen extends StatefulWidget with Screen {
  final UserEntity user;

  FeedScreen({required this.user, Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  StompClient? stompClient;
  final FeedCubit _cubit = injection();
  List<PostagemEntity> postagens = [];

  void onConnect(StompFrame frame) {
    stompClient!.subscribe(
        destination: '/topic/message',
        callback: (StompFrame frame) {
          if (frame.body != null) {
            // Map<String, dynamic> result = json.decode(frame.body as String);
            //print(result['message']);
            // message = result['message']
            setState(() => _cubit.atualizar());
          }
        });
  }

  late Timer _timer;

  final _controller = ScrollController();

  @override
  void initState() {
    _cubit.setToken(widget.user.jwtoken);
    // _timer = new Timer.periodic(Duration(seconds: 8), (Timer timer) {
    //   _cubit.atualizar();
    // });
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (isTop) {
          //_cubit.atualizar(widget.token);
        } else {
          _cubit.aumentarPag();
        }
      }
    });

    // ignore: unnecessary_null_comparison
    if (stompClient == null) {
      stompClient = StompClient(
          config: StompConfig.SockJS(
        url: socketUrl,
        onConnect: onConnect,
        onWebSocketError: (dynamic error) =>
            print("error: " + error.toString()),
      ));

      stompClient!.activate();
    }
    _cubit.atualizar();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  StateController stateController = StateController();
  @override
  Widget build(BuildContext context) {
    //postagens = [postagem2,postagem3,postagem3,postagem3];

    return BlocConsumer<FeedCubit, FeedState>(
        listener: (context, state) {
          print('listener ouvindo');
          postagens = state.postagens;
          return;
        },
        bloc: _cubit,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Olá, ' + widget.user.name.split(" ")[0]),
              actions: const <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ],
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  AppAssets.fennec,
                  color: Colors.white,
                  fit: BoxFit.cover,
                ),
                // SvgPicture.asset(
                //             AppAssets.logoIcon,
                //           ),
              ),
            ),
            body: Container(
              child: Column(children: [
                Container(
                    child: FeedNovaPostagem(
                        cubit: _cubit, token: widget.user.jwtoken)),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: postagens.length,
                      controller: _controller,
                      //itemCount: 0,
                      itemBuilder: (BuildContext context, int index) {
                        //print('dados snapshot: ${snapshot.data!}');
                        return Container(
                          child: FeedPostagem(postagem: postagens[index]),
                          //child: Container(color: Colors.black,width: 30,height:30,),
                        );
                      }),
                ),
              ]),
            ),
          );
        });
  }
}

class StateController extends ChangeNotifier {
  void updateState() {
    notifyListeners();
  }
}
