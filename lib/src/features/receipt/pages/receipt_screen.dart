import 'package:flutter/material.dart';
import 'package:gb_pay_mobile/src/features/receipt/pages/receipt_screen.text.dart';
import 'package:gb_pay_mobile/src/util/colors.dart';
import 'package:gb_pay_mobile/src/util/screen.dart';

class ReceiptScreen extends StatefulWidget with Screen {
  ReceiptScreen({Key? key}) : super(key: key);

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  TextEditingController numeroParcelasController = TextEditingController();
  TextEditingController numeroCartaoController = TextEditingController();
  TextEditingController validadeController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfCnpjController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const [
            Text(
              ReceiptScreenText.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorsProject.blueWhite, size: 40.0),
      ),
      body: Column(
        children: [
          Text(
            ReceiptScreenText.dataHora,
            style: TextStyle(
              fontSize: 20.0,
              color: ColorsProject.lowGrey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Divider(thickness: 3, indent: 30.0, endIndent: 30.0),
          ),
          // conteudo central
          Padding(
            padding: const EdgeInsets.only(left: 35.0, right: 35.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              // color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  // valor
                  TitleWidget(text: ReceiptScreenText.titulo1),
                  ValueWidget(text: ReceiptScreenText.valor),
                  // Quem vai receber
                  TitleWidget(text: ReceiptScreenText.titulo2),
                  SubTitleWidget(text: ReceiptScreenText.subtitulo2),
                  ValueWidget(text: ReceiptScreenText.valor2),
                  // Quem Pagou
                  TitleWidget(text: ReceiptScreenText.titulo3),
                  SubTitleWidget(text: ReceiptScreenText.nomeText),
                  ValueWidget(text: ReceiptScreenText.nomeValue),
                  SubTitleWidget(text: ReceiptScreenText.cpfText),
                  ValueWidget(text: ReceiptScreenText.cpfValue),
                  SubTitleWidget(text: ReceiptScreenText.agenciaText),
                  ValueWidget(text: ReceiptScreenText.agenciaValue),
                  SubTitleWidget(text: ReceiptScreenText.nsuText),
                  ValueWidget(text: ReceiptScreenText.nsuValue),
                  SubTitleWidget(text: ReceiptScreenText.codigoText),
                  ValueWidget(text: ReceiptScreenText.codigoValue),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  final String text;

  const TitleWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 30.0,
        color: ColorsProject.lowGrey,
      ),
    );
  }
}

class SubTitleWidget extends StatelessWidget {
  final String text;

  const SubTitleWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20.0,
        color: ColorsProject.lowGrey,
      ),
    );
  }
}

class ValueWidget extends StatelessWidget {
  final String text;

  const ValueWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 28.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
