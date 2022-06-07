import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:gb_pay_mobile/constants/routes.dart';
import 'package:gb_pay_mobile/features/payment/pages/payment_screen.text.dart';
import 'package:gb_pay_mobile/services/ticket_query_dto.dart';
import 'package:gb_pay_mobile/util/assets.dart';
import 'package:gb_pay_mobile/util/colors.dart';
import 'package:gb_pay_mobile/util/screen.dart';

class PaymentPage extends StatefulWidget with Screen {
  final String user;

  PaymentPage({required this.user, Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String data = "";
  final TicketQueryDTO _ticketQueryDTO = TicketQueryDTO();

  Future scanCodeBar() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
        '#000000', 'Cancelar', true, ScanMode.BARCODE);

    setState(() {
      data = code;
      print('data');
      print(data);
      // tipo do boleto, se o codigo de barras começar com 8 o tipo é 1, com 8 é conta de luz, agua
      // tipo 2 é tipo banco
      var codeBarType = 1;
      if (data.substring(0, 1) == "8") {
        codeBarType = 1;
      } else {
        codeBarType = 2;
      }
      //

      _ticketQueryDTO.ticketQuery(codeBarType, '', data).then((value) {
        print('value on scan');
        print(value);
        widget.navigator.pushNamed(
          AppRouteNames.newPaymentPage,
          arguments: value,
        );
      }).catchError((error) {
        print(error);
        print('Tente ler o codigo de barras mais de perto.');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: const Color(0xFF00C0FF),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 72.0,
          ),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: const Text(
                  'Perfil do usuário',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.money,
                  color: Colors.white,
                ),
                hoverColor: Colors.white70,
                title: const Text(
                  'Extrato',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, AppRouteNames.statement);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                hoverColor: Colors.white70,
                title: const Text(
                  'Sair',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, AppRouteNames.greetings);
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: Image.asset(
          AppAssets.logoIcon,
          color: Colors.white,
          fit: BoxFit.fill,
        ),
        leadingWidth: MediaQuery.of(context).size.width,
        iconTheme: const IconThemeData(color: Colors.white, size: 40.0),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _backButton,
              Padding(
                padding: const EdgeInsets.only(top: 88.0),
                child: Center(
                  child: Text(
                    'Olá, ' + widget.user,
                    style: const TextStyle(
                      color: ColorsProject.blueWhite,
                      fontSize: 30.0,
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
      ),
    );
  }

  Widget get _backButton {
    return const Align(
        alignment: Alignment.topLeft,
        child: BackButton(
          color: ColorsProject.blueWhite,
        ));
  }

  Widget get _dataCode {
    return const Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Text(
        PaymentScreenText.code,
        style: TextStyle(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget get _paymentTitle {
    return const Padding(
      padding: EdgeInsets.only(
        top: 84.0,
        bottom: 24.0,
      ),
      child: Text(
        PaymentScreenText.payment,
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
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
        top: 30.0,
        bottom: 25.0,
      ),
      child: SizedBox(
        height: 60.0,
        width: MediaQuery.of(context).size.width * 0.7,
        child: ElevatedButton(
          onPressed: () {
            scanCodeBar();
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
            primary: ColorsProject.blueWhite,
            elevation: 0,
          ),
          child: const Text(
            PaymentScreenText.useReaderCode,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonEnterCodeBar(BuildContext context) {
    return SizedBox(
      height: 60.0,
      width: MediaQuery.of(context).size.width * 0.7,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRouteNames.codeBarPage);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          primary: ColorsProject.blueWhite,
          elevation: 0,
        ),
        child: const Text(
          PaymentScreenText.enterCode,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
