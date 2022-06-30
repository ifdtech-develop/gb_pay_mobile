import 'dart:convert';

import 'package:gb_pay_mobile/models/ticket_query/ticket_query.dart';
import 'package:gb_pay_mobile/util/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/confirm_payment_system/confirm_payment_system.dart';
import '../shared/confirm_payment/confirm_payment_preferences.dart';
import '../shared/user_data/signin_preferences.dart';

class ConfirmPaymentDTO {
  Future<ConfirmPaymentSystemModel> confirmPayment(
    int externalNSU, int authorizationId
  ) async {
    final String token;
    //final int authorizationId;

    try {
      final prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token')!;
    } on Exception catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }

    final response = await http.put(
      Uri.parse('$serverURL/pagamentos/confirma/$authorizationId'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${UserPreferencs.getToken()}',
      },
      body: jsonEncode(
        { 
          'externalNSU': externalNSU,
        },
      ),
    );

    if (response.statusCode == 200) {
      print(response.body);
      return ConfirmPaymentSystemModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Failed to query ticket');
    }
  }
}
