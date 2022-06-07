import 'package:flutter/material.dart';
import 'package:gb_pay_mobile/features/code_bar/pages/code_bar.dart';
import 'package:gb_pay_mobile/features/credit_card/pages/credit_card_screen.dart';
import 'package:gb_pay_mobile/features/greetings/greetings_page.dart';
import 'package:gb_pay_mobile/features/new_payment/pages/new_payment_screen.dart';
import 'package:gb_pay_mobile/features/payment/pages/payment_screen.dart';
import 'package:gb_pay_mobile/features/payment_location/pages/payment_location_screen.dart';
import 'package:gb_pay_mobile/features/receipt/pages/receipt_screen.dart';
import 'package:gb_pay_mobile/features/signin/signin_page.dart';
import 'package:gb_pay_mobile/features/signup/signup_page.dart';
import 'package:gb_pay_mobile/features/statement/pages/statement_screen.dart';
import 'package:gb_pay_mobile/features/token/token_page.dart';

class AppRouteNames {
  static const String splash = '/';
  static const String greetings = '/greetings';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String token = '/token';
  static const String home = '/home';
  static const String homel = '/homel';
  static const String feed = '/feed';
  static const String paymentpage = '/paymentPage';
  static const String codeBarPage = '/codeBarPage';
  static const String newPaymentPage = '/newPaymentPage';
  static const String creditcard = '/creditcard';
  static const String paymentLocation = '/paymentLocation';
  static const String receipt = '/receipt';
  static const String statement = '/statement';
}

class AppRoutes {
  static final Map<String, Widget Function(Object? args)> routes = {
    AppRouteNames.signin: (_) => SigninPage(),
    AppRouteNames.signup: (_) => const SignupPage(),
    AppRouteNames.greetings: (_) => GreetingsPage(),
    AppRouteNames.token: (_) => const TokenPage(),
    AppRouteNames.paymentpage: (args) => PaymentPage(
          user: args as String,
        ),
    AppRouteNames.codeBarPage: (args) => CodeBarPage(),
    AppRouteNames.newPaymentPage: (args) => const NewPaymentPage(),
    AppRouteNames.creditcard: (_) => CreditCardScreen(),
    AppRouteNames.paymentLocation: (_) => PaymentLocationScreen(),
    AppRouteNames.receipt: (_) => ReceiptScreen(),
    AppRouteNames.statement: (_) => const StatementPage(),
  };
}
