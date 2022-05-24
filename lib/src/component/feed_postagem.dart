import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gb_pay_mobile/src/domain/entity/postagem_entity.dart';
import 'package:gb_pay_mobile/src/util/assets.dart';
import 'package:intl/intl.dart';

class FeedPostagem extends StatelessWidget {
  PostagemEntity postagem;
  FeedPostagem({Key? key, required this.postagem}) : super(key: key);
  //FeedPostagem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date1 = DateFormat("HH:mm:ss")
        .format(DateFormat('HH:mm:ss').parse(postagem.hora));
    final convert1 = DateFormat("HH:mm:ss").parse(date1);

    final date = DateFormat('dd/MM/yyyy')
        .format(DateFormat('yyyy-MM-dd').parse(postagem.data));
    DateTime formatISOTime(DateTime date) {
      var duration = date.timeZoneOffset;
      int h = int.parse(duration.inHours.toString().padLeft(2, '0'));
      int m = int.parse((duration.inMinutes - (duration.inHours * 60))
          .toString()
          .padLeft(2, '0'));
      if (duration.isNegative) {
        return date.add(Duration(hours: h, minutes: m));
        // "-${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
      } else {
        return date.subtract(Duration(hours: h, minutes: m));
      }
    }

    String local = (DateFormat('HH:mm:ss').format(formatISOTime(convert1)));

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        switch (postagem.tipo) {
          //switch ('') {
          case "texto":
            return Container(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                AppAssets.fennec,
                                color: Colors.white,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 10,
                        ),
                        Text(
                          (postagem.usuarioId.name.split(" ").first +
                              " " +
                              (postagem.usuarioId.name.split(" ").length >= 2
                                  ? postagem.usuarioId.name
                                      .split(" ")
                                      .elementAt(1)
                                  : "")),
                          //"exemplo",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF4d4d4d),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      '${date} - ${local}',
                      //Text('',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4d4d4d),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: 100,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF707070),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child:
                          Text(postagem.texto, style: TextStyle(fontSize: 14)),
                      //child: Text("",style:TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
              ],
            ));
          case "repositorio":
            return Container(
              //child: Center(child: Text(postagem.texto)),
              child: Center(child: Text("")),
            );
          case "foto":
            return Container(
              //child: Center(child: Text(postagem.texto)),
              child: Center(child: Text("")),
            );
          default:
            return Container();
        }
      },
    );
  }
}
