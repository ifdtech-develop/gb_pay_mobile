import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';
import 'package:gb_pay_mobile/src/features/feed/pages/feed_screen.dart';
import 'package:gb_pay_mobile/src/features/greetings/pages/greetings_screen.dart';
import 'package:gb_pay_mobile/src/features/home/home_lscreen.dart';
import 'package:gb_pay_mobile/src/features/home/pages/home_screen.dart';
import 'package:gb_pay_mobile/src/features/payment/pages/payment_screen.dart';
import 'package:gb_pay_mobile/src/features/signin/pages/signin_screen.dart';
import 'package:gb_pay_mobile/src/features/signup/pages/signup_screen.dart';
import 'package:gb_pay_mobile/src/features/splash/pages/splash_screen.dart';
import 'package:gb_pay_mobile/src/features/token/pages/token_screen.dart';

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
}

class AppRoutes {
  static final Map<String, Widget Function(Object? args)> routes = {
    AppRouteNames.splash: (_) => SplashScreen(),
    AppRouteNames.greetings: (_) => GreetingsScreen(),
    AppRouteNames.signin: (_) => SigninScreen(),
    AppRouteNames.signup: (_) => SignupScreen(),
    AppRouteNames.token: (_) => TokenScreen(),
    AppRouteNames.feed: (args) => FeedScreen(
          user: args as UserEntity,
        ),
    AppRouteNames.homel: (args) => HomeLScreen(
          token: args as String,
        ),
    AppRouteNames.home: (args) => HomeScreen(
          user: args as UserEntity,
        ),
    AppRouteNames.paymentpage: (args) => PaymentPage(
          user: args as UserEntity,
        ),
    AppRouteNames.codeBarPage: (args) => CodeBarPage(),
    AppRouteNames.newPaymentPage: (args) => NewPaymentPage(),
  };
}
