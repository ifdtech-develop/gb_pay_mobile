import 'dart:convert';

import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';
import 'package:gb_pay_mobile/src/ui/features/pagamento/pages/tela_pagamento.dart';
import 'package:gb_pay_mobile/src/ui/feed/feed_screen.dart';
import 'package:gb_pay_mobile/src/ui/greetings/greetings_screen.dart';
import 'package:gb_pay_mobile/src/ui/home/home_lscreen.dart';
import 'package:gb_pay_mobile/src/ui/home/home_screen.dart';
import 'package:gb_pay_mobile/src/ui/signin/signin_screen.dart';
import 'package:gb_pay_mobile/src/ui/signup/signup_screen.dart';
import 'package:gb_pay_mobile/src/ui/splash/splash_screen.dart';
import 'package:gb_pay_mobile/src/ui/token/token_screen.dart';
import 'package:flutter/material.dart';

class AppRouteNames {
  static const String splash = '/';
  static const String greetings = '/greetings';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String token = '/token';
  static const String home = '/home';
  static const String homel = '/homel';
  static const String feed = '/feed';
  static const String paymentpage = '/paymentpage';
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
  };
}
