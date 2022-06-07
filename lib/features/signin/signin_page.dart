import 'package:flutter/material.dart';
import 'package:gb_pay_mobile/constants/routes.dart';
import 'package:gb_pay_mobile/services/signin_dto.dart';
import 'package:gb_pay_mobile/util/colors.dart';
import 'package:gb_pay_mobile/util/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninPage extends StatefulWidget with Screen {
  SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _formKey = GlobalKey<FormState>();

  SigninDTO _signinDTO = SigninDTO();

  @override
  void initState() {
    super.initState();
    _signinDTO = SigninDTO();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'Que bom te ver novamente! Insira seus dados',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black87,
                        ),
                      )),
                  const SizedBox(
                    height: 40.0,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor insira seu e-mail';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'email@exemplo.com',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 2, color: Colors.grey),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Senha',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 2, color: Colors.grey),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  SizedBox(
                    width: 330.0,
                    height: 40.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorsProject.blueWhite,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _signinDTO
                              .signin(
                                  emailController.text, passwordController.text)
                              .then((value) {
                            _setToken(value.accessToken, value.name, value.id);
                            print('deu bom');
                          }).catchError((error) {
                            print("error");
                            print(error);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(error),
                                duration: const Duration(seconds: 5),
                              ),
                            );
                          });
                        }
                      },
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Não tem conta?',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/signup');
                        },
                        child: const Text(
                          'Cadastre-se',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _setToken(token, name, id) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('token', token);
    prefs.setString('userName', name);
    prefs.setString('userId', id.toString());

    widget.navigator.pushNamed(
      AppRouteNames.paymentpage,
      arguments: name,
    );
  }
}
