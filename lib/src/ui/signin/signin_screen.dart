import 'package:easy_mask/easy_mask.dart';
import 'package:gb_pay_mobile/src/component/fennec_text_field.dart';
import 'package:gb_pay_mobile/src/constants/routes.dart';
import 'package:gb_pay_mobile/src/constants/single.dart';
import 'package:gb_pay_mobile/src/data/model/totp/totp_model.dart';
import 'package:gb_pay_mobile/src/di/injector.dart';
import 'package:gb_pay_mobile/src/ui/signin/signin_cubit.dart';
import 'package:gb_pay_mobile/src/util/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SigninPages {
  email,
  password,
}

class SigninScreen extends StatefulWidget with Screen {
  SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final SigninCubit _cubit = injection();

  final PageController _pageController = PageController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ValueNotifier<SigninPages> _currentPage =
      ValueNotifier(SigninPages.email);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.hasClients) {
        _currentPage.value = SigninPages.values[_pageController.page!.toInt()];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {
          final s = Singleton;
          if (state.user != null) {
            TotpRest totp = TotpRest(
                name: s.nome, tell: _emailController.text, email: s.email);
            print('email: ${s.email}');
            //  final metodod = totp.metodo(imei);
            String login = _emailController.text;
            login = login.replaceAll('.', '');
            login = login.replaceAll('-', '');
            login = login.replaceAll('(', '');
            login = login.replaceAll(')', '');
            login = login.replaceAll(' ', '');
            login = login.replaceAll('+', '');
            totp.fetchTotpDTO(login, s.nome, s.email);
            widget.navigator.pushReplacementNamed(
              AppRouteNames.paymentpage,
              arguments: state.user,
            );
            return;
          }
        },
        bloc: _cubit,
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          widget.colors.primary,
                          widget.colors.secondary,
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: widget.media.size.height * .9,
                      decoration: BoxDecoration(
                        color: widget.colors.background,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(
                            60,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: SizedBox.expand(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ValueListenableBuilder(
                              valueListenable: _currentPage,
                              builder: (_, currentPageValue, child) {
                                return IconButton(
                                  onPressed: () {
                                    if (currentPageValue == SigninPages.email) {
                                      widget.navigator.pop();
                                    } else {
                                      _pageController.previousPage(
                                        duration:
                                            const Duration(milliseconds: 250),
                                        curve: Curves.bounceInOut,
                                      );
                                    }
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_sharp,
                                    color: Colors.grey[500]!,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 24),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: widget.media.size.height / 3,
                              ),
                              child: getPageView(state),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 56,
                      child: ValueListenableBuilder<SigninPages>(
                        valueListenable: _currentPage,
                        builder: (context, currentPage, child) {
                          final page = currentPage.index;
                          final hasError =
                              currentPageHasError(currentPage, state);
                          final isNotLastPage =
                              page < SigninPages.values.length - 1;
                          return BottomButton(
                            hasError: hasError,
                            label: !isNotLastPage ? 'Concluir' : 'Continuar',
                            onTap: () async {
                              if (!hasError) {
                                if (isNotLastPage) {
                                  FocusScope.of(context).unfocus();
                                  await _pageController
                                      .nextPage(
                                        duration:
                                            const Duration(milliseconds: 250),
                                        curve: Curves.bounceInOut,
                                      )
                                      .whenComplete(
                                        () =>
                                            FocusScope.of(context).nextFocus(),
                                      );
                                } else {
                                  _cubit.login();
                                }
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget getPage({
    required String title,
    required String value,
    String? subtitle,
    void Function(String? value)? onChanged,
    TextInputType? inputType,
    List<TextInputMask>? inputMask,
    String? error,
    TextEditingController? controller,
    bool obscure = false,
  }) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          if (subtitle != null) ...[
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
          ],
          FennecTextField(
            onChanged: onChanged,
            inputType: inputType,
            formatters: inputMask,
            error: error,
            autofocus: true,
            obscured: obscure,
            controller: controller,
          )
        ],
      ),
    );
  }

  final Map<SigninPages, bool Function(SigninState)> pagesErrors = {
    SigninPages.email: (state) =>
        state.phone.isEmpty ||
        (state.phoneError != null && state.phoneError!.isNotEmpty),
    SigninPages.password: (state) =>
        state.password.isEmpty ||
        (state.passwordError != null && state.passwordError!.isNotEmpty),
  };

  bool currentPageHasError(SigninPages current, SigninState state) {
    final currentError = pagesErrors[current]?.call(state);
    return currentError ?? false;
  }

  Widget getPageView(SigninState state) => PageView(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        allowImplicitScrolling: false,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          getPage(
            title: 'Que bom te ver novamente! Qual é o seu celular?',
            onChanged: _cubit.setPhone,
            value: state.phone,
            error: state.phoneError,
            inputType: TextInputType.number,
            inputMask: [
              TextInputMask(mask: '(99) 99999-9999'),
            ],
            controller: _emailController,
          ),
          getPage(
            title: 'Senha de acesso ao aplicativo',
            onChanged: _cubit.setPassword,
            value: state.password,
            error: state.passwordError,
            obscure: true,
            controller: _passwordController,
          ),
        ],
      );
}

class BottomButton extends StatelessWidget with Screen {
  BottomButton({
    Key? key,
    required this.hasError,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  final bool hasError;
  final VoidCallback onTap;
  final String label;

  final Color grey = Colors.grey[500]!;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: hasError ? Colors.transparent : null,
          gradient: LinearGradient(
            colors: [
              colors.primary,
              colors.secondary,
            ],
          ),
          border: Border(
            top: BorderSide(
              color: hasError ? grey : colors.primary,
              width: 1,
            ),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 18,
              color: hasError ? grey : colors.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
