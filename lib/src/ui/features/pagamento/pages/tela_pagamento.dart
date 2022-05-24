import 'package:flutter/material.dart';
import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';
import 'package:gb_pay_mobile/src/ui/features/pagamento/pages/tela_pagamento.text.dart';
import 'package:gb_pay_mobile/src/util/assets.dart';
import 'package:gb_pay_mobile/src/util/colors.dart';

class PaymentPage extends StatefulWidget {
  final UserEntity user;

  PaymentPage({required this.user, Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   'Olá, ' + widget.user.name.split(" ")[0],
        //   style: const TextStyle(
        //     fontSize: 27,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        // centerTitle: true,
        leading: Image.asset(
          AppAssets.logoIcon,
          color: Colors.white,
          fit: BoxFit.fill,
        ),
        leadingWidth: MediaQuery.of(context).size.width,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 142.0),
              child: Center(
                child: Text(
                  'Olá, ' + widget.user.name.split(" ")[0],
                  style: TextStyle(
                    color: ColorsProject.blueWhite,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            _dataCode,
            _paymentTitle,
            _paymentIcon,
            _useCodeBar,
            _enterCodeBar,
          ],
        ),
      ),
    );
  }
}

Widget get _dataCode {
  return const Padding(
    padding: EdgeInsets.only(top: 8.0),
    child: Text(
      PaymentScreenText.code,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget get _paymentTitle {
  return const Padding(
    padding: EdgeInsets.only(
      top: 110.0,
      bottom: 24.0,
    ),
    child: Text(
      PaymentScreenText.payment,
      style: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget get _paymentIcon {
  return Container(
    width: 136,
    height: 136,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: ColorsProject.blueWhite,
    ),
    child: const Icon(
      Icons.qr_code_scanner_outlined,
      size: 64.0,
    ),
  );
}

Widget get _useCodeBar {
  return Padding(
    padding: const EdgeInsets.only(
      top: 32.0,
      bottom: 16.0,
    ),
    child: Container(
      width: 294.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: ColorsProject.blueWhite,
      ),
      child: const Center(
        child: Text(
          PaymentScreenText.useReaderCode,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ),
  );
}

Widget get _enterCodeBar {
  return Container(
    width: 294.0,
    height: 50.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6.0),
      color: ColorsProject.whiteSilverLow,
    ),
    child: Center(
      child: Text(
        PaymentScreenText.enterCode,
        style: TextStyle(
          color: ColorsProject.whiteSilver,
          fontSize: 25,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}
