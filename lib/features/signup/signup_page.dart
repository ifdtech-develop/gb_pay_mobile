import 'package:flutter/material.dart';
import 'package:gb_pay_mobile/services/signup_dto.dart';
import 'package:gb_pay_mobile/util/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController documentUserController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _formKey = GlobalKey<FormState>();

  SignupDTO _signupDTO = SignupDTO();

  @override
  void initState() {
    super.initState();
    _signupDTO = SignupDTO();
  }

  @override
  void dispose() {
    nameController.dispose();
    passController.dispose();
    emailController.dispose();
    addressController.dispose();
    documentUserController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: 330.0,
              child: Column(
                children: [
                  Image.asset('assets/images/gbiconcolor.png'),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 8.0,
                      bottom: 16.0,
                    ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Preencha com os seus dados para o cadastro!',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black87,
                          ),
                        )),
                  ),
                  _userInformation('Nome', nameController, ""),
                  _userInformation(
                      'E-mail', emailController, "exemplo@gbpay.com"),
                  _userInformation('Endereço', addressController, ""),
                  _userInformation(
                      'CPF', documentUserController, "000.000.000-00"),
                  _pass(),
                  _confirmPass(),
                  const SizedBox(
                    height: 16.0,
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
                          _signupDTO
                              .signup(
                                  nameController.text,
                                  documentUserController.text,
                                  passController.text,
                                  emailController.text,
                                  addressController.text)
                              .then((value) {
                            print('deu bom');
                            Navigator.pushNamed(context, '/greetings');
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
                        'Cadastrar',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  _divider,
                  _backPage,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get _backPage {
    return TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          'Voltar',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ));
  }

  Widget _userInformation(String text, dynamic controller, String hint) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.fromLTRB(14, 2, 2, 0),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.grey),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  Widget _pass() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Senha',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        TextFormField(
          controller: passController,
          obscureText: true,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.fromLTRB(2, 2, 2, 0),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.grey),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  Widget _confirmPass() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Confirmar a senha',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        TextFormField(
          controller: confirmPassController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "As senhas não conferem";
            }
            return null;
          },
          obscureText: true,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.fromLTRB(2, 2, 2, 0),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.grey),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  Widget get _divider {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: ColorsProject.whiteSilverLow,
        ),
        width: 330.0,
        height: 1.0,
      ),
    );
  }
}
