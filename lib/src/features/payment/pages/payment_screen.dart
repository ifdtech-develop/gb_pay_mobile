import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:gb_pay_mobile/src/constants/routes.dart';
import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';
import 'package:gb_pay_mobile/src/features/payment/pages/payment_screen.text.dart';
import 'package:gb_pay_mobile/src/util/assets.dart';
import 'package:gb_pay_mobile/src/util/colors.dart';

class PaymentPage extends StatefulWidget {
  final UserEntity user;

  PaymentPage({required this.user, Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String data = "";

  Future scanCodeBar() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
        '#000000', 'Cancelar', true, ScanMode.BARCODE);

    setState(() => data = code != '-1' ? code : 'Não validado');
  }

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
        centerTitle: true,
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
              padding: const EdgeInsets.only(top: 104.0),
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
            _buttonUseCodeBar(context),
            _buttonEnterCodeBar(context),
          ],
        ),
      ),
    );
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
      child: Image.asset(AppAssets.barCodeIcon),
    );
  }

  Widget _buttonUseCodeBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24.0,
        bottom: 8.0,
      ),
      child: ElevatedButton(
        onPressed: () {
          scanCodeBar();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          minimumSize: Size(
            294.0,
            32.0,
          ),
          primary: ColorsProject.blueWhite,
          elevation: 0,
        ),
        child: Text(
          PaymentScreenText.useReaderCode,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buttonEnterCodeBar(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRouteNames.codeBarPage);
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        minimumSize: Size(
          294.0,
          32.0,
        ),
        primary: ColorsProject.whiteSilverLow,
        elevation: 0,
      ),
      child: Text(
        PaymentScreenText.enterCode,
        style: TextStyle(
          color: ColorsProject.whiteSilver,
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
