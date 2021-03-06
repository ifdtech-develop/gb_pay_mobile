import 'package:flutter/material.dart';
import 'package:gb_pay_mobile/features/code_bar/pages/code_bar.dart';
import 'package:gb_pay_mobile/features/credit_card/pages/credit_card_screen.dart';
import 'package:gb_pay_mobile/features/failure_payment/pages/failure_payment.dart';
import 'package:gb_pay_mobile/features/greetings/greetings_page.dart';
import 'package:gb_pay_mobile/features/new_payment/pages/new_payment_screen.dart';
import 'package:gb_pay_mobile/features/home/pages/payment_screen.dart';
import 'package:gb_pay_mobile/features/payment_loading/payment_loading.dart';
import 'package:gb_pay_mobile/features/payment_location/pages/payment_location_screen.dart';
import 'package:gb_pay_mobile/features/payment_summary/payment_summary_page.dart';
import 'package:gb_pay_mobile/features/perfil_user/perfil_user_page.dart';
import 'package:gb_pay_mobile/features/receipt/pages/receipt_screen.dart';
import 'package:gb_pay_mobile/features/rescue_pass/pages/rescue_pass.dart';
import 'package:gb_pay_mobile/features/signin/signin_page.dart';
import 'package:gb_pay_mobile/features/signup/signup_page.dart';
import 'package:gb_pay_mobile/features/statement/pages/statement_screen.dart';
import 'package:gb_pay_mobile/models/paymentCard/paymentCard_model.dart';
import 'package:gb_pay_mobile/models/signup/signup_model.dart';
import 'package:gb_pay_mobile/models/ticket_query/ticket_query.dart';

import '../features/token/token_screen.dart';
import '../models/confirm_payment/confirm_payment_model.dart';
import '../models/confirm_payment_system/confirm_payment_system.dart';

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
  static const String paymentSummary = '/paymentSummary';
  static const String perfilUser = '/perfilUser';
  static const String loadingPayment = '/loadingPayment';
  static const String failurePayment = '/failurePayment';
  static const String rescuePassword = '/rescuePassword';
}

class AppRoutes {
  static final Map<String, Widget Function(Object? args)> routes = {
    AppRouteNames.signin: (_) => SigninPage(),
    AppRouteNames.signup: (_) => const SignupPage(),
    AppRouteNames.greetings: (_) => GreetingsPage(),
    AppRouteNames.token: (_) => TokenPage(),
    AppRouteNames.paymentpage: (args) => PaymentPage(
          user: args as String,
        ),
    AppRouteNames.codeBarPage: (args) => CodeBarPage(),
    AppRouteNames.newPaymentPage: (args) => NewPaymentPage(
          ticketInfo: args as TicketQuery,
        ),
    AppRouteNames.creditcard: (args) => CreditCardScreen(
          valor: args as double,
        ),
    AppRouteNames.paymentLocation: (args) => PaymentLocationScreen(),
    AppRouteNames.receipt: (args) => ReceiptScreen(
          realizePayment: args as ConfirmPaymentModel,
        ),
    AppRouteNames.statement: (_) => const StatementPage(),
    AppRouteNames.paymentSummary: (_) => const PaymentSummaryPage(),
    AppRouteNames.perfilUser: (_) => const PerfilUserPage(),
    AppRouteNames.loadingPayment: (_) => PaymentLoadingPage(),
    AppRouteNames.failurePayment: (_) => FaitlurePage(),
    AppRouteNames.rescuePassword: (_) => RescuePage(),
  };
}
