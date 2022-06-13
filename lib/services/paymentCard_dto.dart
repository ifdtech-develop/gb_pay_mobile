import 'dart:convert';

import 'package:gb_pay_mobile/models/paymentCard/paymentCard_model.dart';
import 'package:gb_pay_mobile/models/signin/signin_model.dart';
import 'package:gb_pay_mobile/models/signup/signup_model.dart';
import 'package:gb_pay_mobile/services/signin_dto.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PaymentCardDTO{
  Future<PaymentCardModel> payment(
    String cardNumber,
    String cardHolder,
    String cardHolderDocument,
    int expirationMonth,
    int expirationYear,
    String securityCode,
    String brand,
    int amount,
  ) async {
    final String token;
    final String name;
    final String lastName;

    final response = await http.post(
      Uri.parse('https://mqzvn3zk5c.execute-api.sa-east-1.amazonaws.com/beta/authorize'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          'card':{
            'cardNumber': cardNumber,
            'cardHolder': cardHolder,
            'cardHolderDocument': cardHolderDocument,
            'expirationMonth': expirationMonth,
            'expirationYear': expirationYear,
            'securityCode': securityCode,
            'brand': brand,
          },

          'payment': {
            'documentNumber': cardHolderDocument,
            'amount': amount,
          },
          'customer': {
            'firstName': cardHolder,
            'lastName': cardHolder,
            'documentNumber': '76600763000135',
          }
        },
    ),
    );
    if(response.statusCode == 200){
      print(response.body);
      return PaymentCardModel.fromJson(jsonDecode(response.body));
    }else {
      print(response.body);
      throw Exception('Failed to payment');
    }
  }
}