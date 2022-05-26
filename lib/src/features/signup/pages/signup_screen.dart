import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/scheduler.dart';
import 'package:gb_pay_mobile/src/component/fennec_text_field.dart';
import 'package:gb_pay_mobile/src/constants/routes.dart';
import 'package:gb_pay_mobile/src/data/model/totp/totp_model.dart';
import 'package:gb_pay_mobile/src/di/injector.dart';
import 'package:gb_pay_mobile/src/features/signup/pages/signup_screen.text.dart';
import 'package:gb_pay_mobile/src/features/signup/signup_cubit.dart';
import 'package:gb_pay_mobile/src/features/token/pages/token_screen.dart';
import 'package:gb_pay_mobile/src/util/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_device_id/platform_device_id.dart';

enum SignupPages {
  fullName,
  //document,
  email,
  birthDate,
  phoneNumber,
  //identity,
  password,
  confirmPassword,
}

class SignupScreen extends StatefulWidget with Screen {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignupCubit _cubit = injection();

  final PageController _pageController = PageController();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _documentController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _identityController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  late bool birthDateValid = false;

  final ValueNotifier<SignupPages> _currentPage =
      ValueNotifier(SignupPages.fullName);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      SchedulerBinding.instance?.addPostFrameCallback(
        (_) {
          if (_pageController.hasClients) {
            _currentPage.value =
                SignupPages.values[_pageController.page!.toInt()];
          }
        },
      );
    });
  }

  @override
  void dispose() {
    _currentPage.dispose();
    _nameController.dispose();
    // _documentController.dispose();
    _emailController.dispose();
    _birthDateController.dispose();
    _phoneController.dispose();
    // _identityController.dispose();
    _passwordController.dispose();
    _pageController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state.user != null) {
            widget.navigator.pushReplacementNamed(
              AppRouteNames.home,
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
                                    if (currentPageValue ==
                                        SignupPages.fullName) {
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
                      height: widget.media.size.height * .09,
                      child: ValueListenableBuilder<SignupPages>(
                        valueListenable: _currentPage,
                        builder: (context, currentPage, child) {
                          final page = currentPage.index;
                          final hasError =
                              currentPageHasError(currentPage, state);
                          final isNotLastPage =
                              page < SignupPages.values.length - 1;
                          return BottomButton(
                            hasError: hasError,
                            label: !isNotLastPage ? 'Concluir' : 'Continuar',
                            onTap: () async {
                              if (!hasError) {
                                FocusScope.of(context).unfocus();
                                if (isNotLastPage) {
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
                                  print("Chegou na ultima página");
                                  _cubit.signupUser();
                                  TotpRest totp = TotpRest(
                                      name: _nameController.text,
                                      tell: _phoneController.text);
                                  //  final metodod = totp.metodo(imei);
                                  String login = _phoneController.text;
                                  String cpf = _documentController.text;
                                  login = login.replaceAll('.', '');
                                  login = login.replaceAll('-', '');
                                  login = login.replaceAll('(', '');
                                  login = login.replaceAll(')', '');
                                  login = login.replaceAll(' ', '');
                                  login = login.replaceAll('+', '');
                                  cpf = cpf.replaceAll('.', '');
                                  cpf = cpf.replaceAll('-', '');
                                  totp.fetchTotpDTO(login, _nameController.text,
                                      _emailController.text);
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
    bool autofocus = false,
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
            autofocus: autofocus,
            obscured: obscure,
            controller: controller,
          )
        ],
      ),
    );
  }

  final Map<SignupPages, bool Function(SignupState)> pagesErrors = {
    SignupPages.fullName: (state) =>
        state.name.isEmpty ||
        (state.nameError != null && state.nameError!.isNotEmpty),
    /*SignupPages.document: (state) =>
        state.document.isEmpty ||
        (state.documentError != null && state.documentError!.isNotEmpty),*/
    SignupPages.email: (state) =>
        state.email.isEmpty ||
        (state.emailError != null && state.emailError!.isNotEmpty),
    SignupPages.birthDate: (state) =>
        state.birthDate.isEmpty ||
        (state.birthDateError != null && state.birthDateError!.isNotEmpty),
    SignupPages.phoneNumber: (state) =>
        state.phone.isEmpty ||
        (state.phoneError != null && state.phoneError!.isNotEmpty),
    /*SignupPages.identity: (state) =>
        state.identity.isEmpty ||
        (state.identityError != null && state.identityError!.isNotEmpty),*/
    SignupPages.password: (state) =>
        state.password.isEmpty ||
        (state.passwordError != null && state.passwordError!.isNotEmpty),
    SignupPages.confirmPassword: (state) =>
        state.confirmPassword.isEmpty ||
        (state.confirmPasswordError != null &&
            state.confirmPasswordError!.isNotEmpty),
  };

  bool currentPageHasError(SignupPages current, SignupState state) {
    //print("erro $current");
    final currentError = pagesErrors[current]?.call(state);
    return currentError ?? false;
  }

  Widget getPageView(SignupState state) => PageView(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        allowImplicitScrolling: false,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          getPage(
            title: SignupScreenText.welcomeTitle,
            subtitle: SignupScreenText.welcomeSubTitle,
            onChanged: _cubit.setName,
            value: state.name,
            error: state.nameError,
            controller: _nameController,
            autofocus: true,
          ),
          /*getPage(
            title: 'Qual é o seu CPF?',
            subtitle: 'Ele usado como sua principal identificação no Fennec.',
            onChanged: _cubit.setDocument,
            value: state.document,
            error: state.documentError,
            inputMask: [
              TextInputMask(mask: '999.999.999-99'),
            ],
            inputType: TextInputType.number,
            controller: _documentController,
          ),*/
          getPage(
            title: SignupScreenText.emailTitle,
            subtitle: SignupScreenText.emailSubTitle,
            onChanged: _cubit.setEmail,
            value: state.email,
            error: state.emailError,
            inputType: TextInputType.emailAddress,
            controller: _emailController,
          ),
          getPage(
            title: SignupScreenText.dateTitle,
            subtitle: SignupScreenText.dateSubTitle,
            onChanged: _cubit.setBirthDate,
            value: state.birthDate,
            error: state.birthDateError,
            inputType: TextInputType.number,
            inputMask: [
              TextInputMask(
                mask: '00/00/0000',
                maxLength: 11,
              ),
            ],
            controller: _birthDateController,
          ),
          getPage(
            title: SignupScreenText.telephoneTitle,
            subtitle: SignupScreenText.telephoneSubTitle,
            onChanged: _cubit.setPhone,
            value: state.phone,
            error: state.phoneError,
            inputType: TextInputType.number,
            inputMask: [
              TextInputMask(
                mask: '(00) 00000-0000',
                placeholder: ' ',
                maxLength: 15,
              ),
            ],
            controller: _phoneController,
          ),
          /*
          getPage(
            title: 'Qual é a sua identidade?',
            onChanged: _cubit.setIdentity,
            value: state.identity,
            error: state.identityError,
            inputType: TextInputType.number,
            inputMask: [
              TextInputMask(
                mask: '99.999.999-9',
              ),
            ],
            controller: _identityController,
          ),*/
          getPage(
            title: SignupScreenText.labelPass,
            onChanged: _cubit.setPassword,
            value: state.password,
            error: state.passwordError,
            obscure: true,
            controller: _passwordController,
          ),
          getPage(
            title: SignupScreenText.labelConfirmPass,
            onChanged: _cubit.setConfirmPassword,
            value: state.confirmPassword,
            error: state.confirmPasswordError,
            obscure: true,
            controller: _confirmPasswordController,
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
              width: 1.5,
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
