import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gb_pay_mobile/constants/routes.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../components/signin_components/form_inputs_components.dart';
import '../../../util/colors.dart';
import '../../../widgets/divider.dart';
import '../../../widgets/messageError_widget.dart';

class RescuePage extends StatefulWidget {
  const RescuePage({Key? key}) : super(key: key);

  @override
  State<RescuePage> createState() => _RescuePageState();
}

class _RescuePageState extends State<RescuePage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool obscure = true;
  bool obscureConfirm = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: const CircularProgressIndicator(
        color: ColorsProject.blueWhite,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: SizedBox(
                width: 330.0,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 180.0,
                    ),
                    Image.asset('assets/images/gbiconcolor.png'),
                    const SizedBox(
                      height: 24.0,
                    ),
                    const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Por favor, insira uma nova senha',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black87,
                          ),
                        )),
                    const SizedBox(
                      height: 32.0,
                    ),
                    FormInputs(
                      controller: emailController,
                      title: 'E-mail',
                      hintText: 'email@exemplo.com',
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Nova Senha',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: validatorPass,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureConfirm = !obscureConfirm;
                            });
                          },
                          icon: Icon(Icons.visibility),
                        ),
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 8),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      obscureText: obscureConfirm,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Confirmar Senha',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: confirmPasswordController,
                      validator: confirmPass,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                          icon: Icon(Icons.visibility),
                        ),
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 8),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      obscureText: obscure,
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    SizedBox(
                      width: 330.0,
                      height: 40.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ColorsProject.blueWhite,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: Text(
                          'Recuperar Senha',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    DividerWidget(
                      altura: 1,
                    ),
                    _backPage
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? validatorPass(value) {
    if (value.isEmpty) {
      return 'Por favor, insira uma senha';
    } else if (value.length < 4) {
      return 'Sua senha deve ter no mínimo 4 caracteres';
    } else {
      return null;
    }
  }

  String? confirmPass(value) {
    if (passwordController.text != value) {
      return 'As senhas não são iguais';
    } else {
      return null;
    }
  }

  Widget get _backPage {
    return TextButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, AppRouteNames.signin);
        },
        child: const Text(
          'Voltar',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ));
  }
}
