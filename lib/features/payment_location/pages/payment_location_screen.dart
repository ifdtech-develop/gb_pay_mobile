import 'package:flutter/material.dart';
import 'package:gb_pay_mobile/constants/routes.dart';
import 'package:gb_pay_mobile/features/payment_location/pages/payment_location_screen.text.dart';
import 'package:gb_pay_mobile/models/paymentCard/paymentCard_model.dart';
import 'package:gb_pay_mobile/util/colors.dart';
import 'package:gb_pay_mobile/util/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentLocationScreen extends StatefulWidget with Screen {
  PaymentCardModel paymentInformation;
  PaymentLocationScreen({Key? key, required this.paymentInformation}) : super(key: key);

  @override
  State<PaymentLocationScreen> createState() => _PaymentLocationScreenState();
}

class _PaymentLocationScreenState extends State<PaymentLocationScreen> {
  TextEditingController cepController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController complementoController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController estadoController = TextEditingController();

  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    PaymentLocationScreenText.getStates();
    dropdownValue = dropdownValue = PaymentLocationScreenText.listOfStates[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          PaymentLocationScreenText.title,
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
                  PaymentLocationScreenText.estado,
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
                      items: PaymentLocationScreenText.listOfStates
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
              numeroCartaoController: cepController,
              title: PaymentLocationScreenText.cep,
            ),
            FormInputs(
              numeroCartaoController: bairroController,
              title: PaymentLocationScreenText.bairro,
            ),
            FormInputs(
              numeroCartaoController: enderecoController,
              title: PaymentLocationScreenText.endereco,
            ),
            FormInputs(
              numeroCartaoController: numeroController,
              title: PaymentLocationScreenText.numero,
            ),
            FormInputs(
              numeroCartaoController: complementoController,
              title: PaymentLocationScreenText.complemento,
            ),
            FormInputs(
              numeroCartaoController: cidadeController,
              title: PaymentLocationScreenText.cidade,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60.0,
              child: ElevatedButton(
                onPressed: () {
                  widget.navigator.pushNamed(AppRouteNames.receipt, arguments: PaymentCardModel());
                },
                child: const Text(
                  'Pagar',
                  style: TextStyle(fontSize: 28.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }}


class FormInputs extends StatelessWidget {
  final TextEditingController numeroCartaoController;
  final String title;

  const FormInputs({
    Key? key,
    required this.numeroCartaoController,
    required this.title,
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
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsProject.strongGrey,
              ),
            ),
            // Border quando usuario clica no input
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
