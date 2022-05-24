import 'package:gb_pay_mobile/src/component/fennec_primary_button.dart';
import 'package:gb_pay_mobile/src/component/fennec_secondary_button.dart';
import 'package:gb_pay_mobile/src/constants/routes.dart';
import 'package:gb_pay_mobile/src/constants/single.dart';
import 'package:gb_pay_mobile/src/domain/repository/user_repository.dart';
import 'package:gb_pay_mobile/src/domain/use_case/device_user_use_case.dart';
import 'package:gb_pay_mobile/src/infra/domain/repository/app_user_repository.dart';
import 'package:gb_pay_mobile/src/util/assets.dart';
import 'package:gb_pay_mobile/src/util/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GreetingsScreen extends StatelessWidget with Screen {
  GreetingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      AppAssets.logoIcon,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FennecPrimaryButton(
                      label: 'Começar',
                      onPressed: () {
                        navigator.pushNamed(AppRouteNames.signup);
                      },
                    ),
                    const SizedBox(height: 16),
                    FennecPrimaryButton(
                      label: 'Entrar na minha conta',
                      onPressed: () {
                        navigator.pushNamed(AppRouteNames.signin);
                      },
                    ),
                    const SizedBox(height: 16),
                    FennecSecondaryButton(
                      label: 'Token',
                      onPressed: () {
                        navigator.pushNamed(AppRouteNames.token);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
