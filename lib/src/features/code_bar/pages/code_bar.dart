import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:gb_pay_mobile/src/features/code_bar/pages/code_bar.text.dart';
import 'package:gb_pay_mobile/src/features/payment/pages/payment_screen.dart';
import 'package:gb_pay_mobile/src/util/assets.dart';
import 'package:gb_pay_mobile/src/util/colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../constants/routes.dart';
import '../../payment/pages/payment_screen.text.dart';

class CodeBarPage extends StatefulWidget {
  const CodeBarPage({Key? key}) : super(key: key);

  @override
  State<CodeBarPage> createState() => _CodeBarPageState();
}

class _CodeBarPageState extends State<CodeBarPage> {
  String codeBar = '';
  String description = '';
  TextEditingController codeBarController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '#####.##### #####.###### ### #####.###### # ##############',
      type: MaskAutoCompletionType.lazy);

  Future scanCodeBar() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
        '#000000', 'Cancelar', true, ScanMode.BARCODE);

    setState(() => codeBar = code != '-1' ? code : 'Não validado');
  }

  @override
  void initState() {
    super.initState();
    codeBarController.addListener(() {
      codeBar = codeBarController.text;
      description = descriptionController.text;
    });
  }

  @override
  void dispose() {
    codeBarController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            CodeBarText.title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: BackButton(),
          actions: [
            IconButton(
                onPressed: () {
                  scanCodeBar();
                },
                icon: Image.asset(
                  AppAssets.cameraIcon,
                  color: Colors.white,
                )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 48.0,
          ),
          child: Container(
            child: Column(
              children: [
                _codeBar(context),
                _description(context),
                _continueButton,
              ],
            ),
          ),
        ));
  }

  Widget _codeBar(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 8.0,
          ),
          child: SizedBox(
            width: 330.0,
            child: Align(
              alignment: Alignment.topLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: CodeBarText.codeBar,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    TextSpan(text: '   '),
                    WidgetSpan(
                      child: Icon(
                        Icons.info,
                        size: 20.0,
                        color: ColorsProject.whiteSilverLow,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Center(
          child: SizedBox(
            width: 330.0,
            child: TextField(
              inputFormatters: [maskFormatter],
              controller: codeBarController,
              style: TextStyle(
                fontSize: 18.0,
              ),
              maxLines: 2,
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              onChanged: (text) {
                codeBar = codeBarController.text;
                codeBar = codeBar.replaceAll('.', '');
                codeBar = codeBar.replaceAll(' ', '');
              },
            ),
          ),
        ),
        _divider,
      ],
    );
  }

  Widget _description(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40.0,
        bottom: 24.0,
      ),
      child: SizedBox(
        width: 330.0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16.0,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  CodeBarText.description,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Center(
              child: TextField(
                controller: descriptionController,
                style: TextStyle(
                  fontSize: 16.0,
                ),
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: CodeBarText.exampleDescription,
                  border: InputBorder.none,
                  isDense: true,
                ),
                textInputAction: TextInputAction.done,
                onChanged: (text) {
                  description = descriptionController.text;
                },
              ),
            ),
            _divider,
          ],
        ),
      ),
    );
  }

  Widget get _continueButton {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRouteNames.newPaymentPage);
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        minimumSize: Size(
          330.0,
          48.0,
        ),
        primary: ColorsProject.blueWhite,
        elevation: 0,
      ),
      child: Text(
        CodeBarText.nextButton,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget get _divider {
    return Container(
      width: 330.0,
      height: 2.0,
      color: ColorsProject.blueWhite,
    );
  }
}
