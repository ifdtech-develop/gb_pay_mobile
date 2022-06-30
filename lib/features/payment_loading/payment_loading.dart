import 'package:flutter/material.dart';
import 'package:gb_pay_mobile/util/assets.dart';
import 'package:gb_pay_mobile/util/colors.dart';

import '../../models/confirm_payment/confirm_payment_model.dart';
import '../../models/paymentCard/paymentCard_model.dart';
import '../../services/confirm_payment.dart';

class PaymentLoadingPage extends StatefulWidget {
  const PaymentLoadingPage({Key? key, }) : super(key: key);

  @override
  State<PaymentLoadingPage> createState() => _PaymentLoadingPageState();
}


class _PaymentLoadingPageState extends State<PaymentLoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Image.asset(AppAssets.logoIconColor),
            SizedBox(height: 24.0,),
            Text('Estamos processando seu pagamento!',
            style: TextStyle(fontSize: 22.0,),),
            SizedBox(height: 12.0,),
            Text('Aguarde enquanto trabalhamos por você! :)',style: TextStyle(fontSize: 18.0,),),
            SizedBox(height:12.0,),
            LinearProgressIndicator(color: ColorsProject.blueWhite,valueColor: new AlwaysStoppedAnimation<Color>(
                    ColorsProject.blueWhite)),
          ],
        ),
      ),
    );
  }
}