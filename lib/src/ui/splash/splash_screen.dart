import 'package:gb_pay_mobile/src/constants/routes.dart';
import 'package:gb_pay_mobile/src/di/injector.dart';
import 'package:gb_pay_mobile/src/ui/splash/splash_cubit.dart';
import 'package:gb_pay_mobile/src/util/assets.dart';
import 'package:gb_pay_mobile/src/util/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget with Screen {
  SplashScreen({Key? key}) : super(key: key);
  final SplashCubit _cubit = injection();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      bloc: _cubit,
      listener: (context, state) {
        if (state.shouldRedirect) {
          if ((state.user != null)) {
            navigator.pushReplacementNamed(AppRouteNames.greetings);
            navigator.pushNamed(
              AppRouteNames.paymentpage,
              arguments: state.user,
            );
          } else {
            navigator.pushReplacementNamed(AppRouteNames.greetings);
          }
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colors.primary,
                colors.secondary,
              ],
            ),
          ),
          child: Center(
            child: Image.asset(
              AppAssets.logoIcon,
            ),
          ),
        ),
      ),
    );
  }
}
