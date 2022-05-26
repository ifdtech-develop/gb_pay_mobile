import 'package:flutter/material.dart';
import 'package:gb_pay_mobile/src/constants/routes.dart';
import 'package:gb_pay_mobile/src/di/app_injector.dart';
import 'package:gb_pay_mobile/src/di/injector.dart';
import 'package:gb_pay_mobile/src/features/not_found/pages/not_found_screen.dart';
import 'package:gb_pay_mobile/src/util/colors.dart';
import 'package:gb_pay_mobile/src/util/global_context.dart';
import 'package:gb_pay_mobile/src/util/service_location.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppInjector().injection(injection);

  NavigationService().setupLocator();

  runApp(const FennecApp());
}

class FennecApp extends StatefulWidget {
  const FennecApp({Key? key}) : super(key: key);

  @override
  State<FennecApp> createState() => _FennecAppState();
}

class _FennecAppState extends State<FennecApp> {
  final ThemeData themeData = ThemeData.light();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouteNames.splash,
      navigatorKey: locator<NavigationService>().navigatorKey,
      theme: themeData.copyWith(
        colorScheme: AppColors().colors,
        textTheme: TextTheme(
          headline1: themeData.textTheme.headline1
              ?.copyWith(fontFamily: 'ArialRounded'),
          headline2: themeData.textTheme.headline2
              ?.copyWith(fontFamily: 'ArialRounded'),
          headline3: themeData.textTheme.headline3
              ?.copyWith(fontFamily: 'ArialRounded'),
          headline4: themeData.textTheme.headline4
              ?.copyWith(fontFamily: 'ArialRounded'),
          headline5: themeData.textTheme.headline5
              ?.copyWith(fontFamily: 'ArialRounded'),
          headline6: themeData.textTheme.headline6
              ?.copyWith(fontFamily: 'ArialRounded'),
          subtitle1: themeData.textTheme.subtitle1
              ?.copyWith(fontFamily: 'ArialRounded'),
          subtitle2: themeData.textTheme.subtitle2
              ?.copyWith(fontFamily: 'ArialRounded'),
          bodyText1: themeData.textTheme.bodyText1
              ?.copyWith(fontFamily: 'ArialRounded'),
          bodyText2: themeData.textTheme.bodyText2
              ?.copyWith(fontFamily: 'ArialRounded'),
          caption:
              themeData.textTheme.caption?.copyWith(fontFamily: 'ArialRounded'),
          button:
              themeData.textTheme.button?.copyWith(fontFamily: 'ArialRounded'),
          overline: themeData.textTheme.overline
              ?.copyWith(fontFamily: 'ArialRounded'),
        ),
      ),
      onGenerateRoute: (settings) => MaterialPageRoute(
        settings: settings,
        maintainState: false,
        builder: (context) {
          GlobalContext.I.setContext(context);
          return AppRoutes.routes[settings.name]?.call(settings.arguments) ??
              NotFoundScreen();
        },
      ),
    );
  }
}
