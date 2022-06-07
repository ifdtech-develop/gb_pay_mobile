import 'package:flutter/material.dart';
import 'package:gb_pay_mobile/constants/routes.dart';
import 'package:gb_pay_mobile/features/credit_card/pages/credit_card_screen.text.dart';
import 'package:gb_pay_mobile/util/colors.dart';

import 'package:gb_pay_mobile/util/screen.dart';

class CreditCardScreen extends StatefulWidget with Screen {
  CreditCardScreen({Key? key}) : super(key: key);

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  TextEditingController numeroParcelasController = TextEditingController();
  TextEditingController numeroCartaoController = TextEditingController();
  TextEditingController validadeController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfCnpjController = TextEditingController();

  String dropdownValue = CreditCardScreenText.listOfParcels[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          CreditCardScreenText.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme:
            const IconThemeData(color: ColorsProject.blueWhite, size: 40.0),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  CreditCardScreenText.parcelas,
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                InputDecorator(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(5.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorsProject.strongGrey,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorsProject.strongGrey,
                      ),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: CreditCardScreenText.listOfParcels
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            FormInputs(
              numeroCartaoController: numeroCartaoController,
              title: CreditCardScreenText.cartao,
              icon: Icons.credit_card,
            ),
            Row(
              children: [
                Expanded(
                  child: FormInputs(
                    numeroCartaoController: validadeController,
                    title: CreditCardScreenText.validade,
                    icon: Icons.calendar_month_outlined,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: FormInputs(
                      numeroCartaoController: cvvController,
                      title: CreditCardScreenText.cvv,
                      icon: Icons.lock_open_outlined,
                    ),
                  ),
                ),
              ],
            ),
            FormInputs(
              numeroCartaoController: nomeController,
              title: CreditCardScreenText.nomeImpresso,
              icon: Icons.person_outline,
            ),
            FormInputs(
              numeroCartaoController: cpfCnpjController,
              title: CreditCardScreenText.cpfCnpj,
              icon: Icons.badge_outlined,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60.0,
              child: ElevatedButton(
                onPressed: () {
                  widget.navigator.pushNamed(AppRouteNames.paymentLocation);
                },
                child: const Text(
                  'Continuar',
                  style: TextStyle(fontSize: 28.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FormInputs extends StatelessWidget {
  final TextEditingController numeroCartaoController;
  final String title;
  final IconData icon;

  const FormInputs({
    Key? key,
    required this.numeroCartaoController,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 25.0,
          ),
        ),
        TextFormField(
          controller: numeroCartaoController,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: ColorsProject.blueWhite,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsProject.strongGrey,
              ),
            ),
            // Border quando usuario clica no input
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
