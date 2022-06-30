import 'dart:convert';

import 'package:gb_pay_mobile/models/confirm_payment/confirm_payment_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/user_data/signin_preferences.dart';
import 'package:flutter/foundation.dart';

class RealizePaymentQuery {
  Future<ConfirmPaymentModel> payment(
    int nsu,
    String externalTerminal,
    String cpf,
    double valueFee,
    double originalValue,
    double valueWithAdditional,
    String nome,
    int typeBarCode,
    String digitable,
    String barCode,
    DateTime dueDate,
    int transactionIdAuthorize,
  ) async {
    final String token;

    try {
      final prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token')!;
    } on Exception catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }

    void printWrapped(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

    final response = await http.post(
      Uri.parse('http://3.135.200.237:3000/pagamentos/efetua/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${UserPreferencs.getToken()}',
      },
      body: jsonEncode({
          "convenant": "string",
          "externalNSU": 1234,
          "externalTerminal": '02212451202',
          "cpfcnpj": "10480314000192",
          "billData": {
            "value": 10,
            "originalValue": 10,
            "valueWithDiscount": 0,
            "valueWithAdditional": valueWithAdditional
          },
          "infoBearer": {
            "nameBearer": nome,
            "documentBearer": cpf,
            "methodPaymentCode": 2
          },
          "barCode": {
            "type": typeBarCode,
            "digitable": digitable,
            "barCode": barCode
          },
          "dueDate": "2022-06-30T00:00:00Z",
          "transactionIdAuthorize": 816311348,
          "userType": 1,
          "corban": ""
      }),
    );
    if (response.statusCode == 200) {
      printWrapped(response.body);
      return ConfirmPaymentModel.fromMap(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Failed to query ticket');
    }
  }
}
