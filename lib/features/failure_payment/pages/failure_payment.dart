import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gb_pay_mobile/constants/routes.dart';

import '../../../shared/user_data/signin_preferences.dart';
import '../../../util/colors.dart';

class FaitlurePage extends StatefulWidget {
  const FaitlurePage({Key? key}) : super(key: key);

  @override
  State<FaitlurePage> createState() => _FaitlurePageState();
}

class _FaitlurePageState extends State<FaitlurePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Falha de Pagamento',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/na.png',
                height: MediaQuery.of(context).size.height * 0.18,
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'Seu pagamento não foi aprovado. :(',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                'Por favor tente novamente com outro cartão!',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouteNames.paymentpage,
                      arguments: UserPreferencs.getUserName());
                },
                child: Text(
                  'Voltar para Tela Inicial',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
