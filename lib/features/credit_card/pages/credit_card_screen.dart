import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gb_pay_mobile/constants/routes.dart';
import 'package:gb_pay_mobile/features/credit_card/pages/credit_card_screen.text.dart';
import 'package:gb_pay_mobile/models/paymentCard/paymentCard_model.dart';
import 'package:gb_pay_mobile/services/paymentCard_dto.dart';
import 'package:gb_pay_mobile/util/colors.dart';

import 'package:gb_pay_mobile/util/screen.dart';

import '../../../components/credit_card_components/form_inputs_components.dart';
import '../../../models/ticket_query/ticket_query.dart';

class CreditCardScreen extends StatefulWidget with Screen {
  final int valor;
  CreditCardScreen({Key? key, required this.valor}) : super(key: key);

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  TextEditingController numeroParcelasController = TextEditingController();
  TextEditingController numeroCartaoController = TextEditingController();
  TextEditingController validadeMonthController = TextEditingController();
  TextEditingController validadeYearController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfCnpjController = TextEditingController();

  //String dropdownValue = CreditCardScreenText.listOfParcels[0];
  final _formKey = GlobalKey<FormState>();
  PaymentCardDTO _paymentCard = PaymentCardDTO();
  PaymentCardModel _payment = PaymentCardModel();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        _paymentCard = PaymentCardDTO();
        isLoading = false;
      },
    );
  }

  @override
  void dispose() {
    numeroCartaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> listOfParcels = [
      '1x de R\$ ${widget.valor.toDouble().toStringAsFixed(2)}',
      '2x de R\$ ${(widget.valor.toDouble() / 2).toStringAsFixed(2)}, total de R\$ ${widget.valor.toDouble().toStringAsFixed(2)}',
      '3x de R\$ ${(widget.valor.toDouble() / 3).toStringAsFixed(2)}, total de ${widget.valor.toDouble().toStringAsFixed(2)}',
      '4x de R\$ ${(widget.valor.toDouble() / 4).toStringAsFixed(2)}, total de R\$ ${widget.valor.toDouble().toStringAsFixed(2)}'
    ];
    String dropdownValue = listOfParcels[0];
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: Form(
          key: _formKey,
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
                        items: listOfParcels
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
                validator: 'número de cartão',
              ),
              Row(
                children: [
                  Expanded(
                    child: FormInputs(
                      numeroCartaoController: validadeMonthController,
                      title: 'Mês',
                      icon: Icons.calendar_month_outlined,
                      validator: 'o mês',
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: FormInputs(
                        numeroCartaoController: validadeYearController,
                        title: 'Ano',
                        icon: Icons.calendar_month_outlined,
                        validator: 'o ano',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: FormInputs(
                        numeroCartaoController: cvvController,
                        title: CreditCardScreenText.cvv,
                        icon: Icons.lock_open_outlined,
                        validator: 'o cvv',
                      ),
                    ),
                  ),
                ],
              ),
              FormInputs(
                numeroCartaoController: nomeController,
                title: CreditCardScreenText.nomeImpresso,
                icon: Icons.person_outline,
                validator: 'o nome',
              ),
              FormInputs(
                numeroCartaoController: cpfCnpjController,
                title: CreditCardScreenText.cpfCnpj,
                icon: Icons.badge_outlined,
                validator: 'o cpf',
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60.0,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate() || isLoading) {
                      var brandType = '';
                      if (numeroCartaoController.text.substring(0, 1) == "4") {
                        brandType = 'visa';
                      } else if (numeroCartaoController.text.substring(0, 1) ==
                          "5") {
                        brandType = 'mastercard';
                      }
                      setState(() {
                        isLoading = true;
                      });
                      _paymentCard
                          .payment(
                            numeroCartaoController.text,
                            nomeController.text,
                            cpfCnpjController.text,
                            7,
                            26,
                            cvvController.text,
                            brandType,
                            widget.valor,
                          )
                          .then((value) {
                             widget.navigator.pushNamed(AppRouteNames.receipt, arguments: value);
                          })
                          .catchError((error) {
                        print(error);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            content: Text('data'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                      );
                    }
                    await Future.delayed(Duration(seconds: 3));
                    if (isLoading = mounted) {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  child: isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: ColorsProject.whiteSilver,
                            ),
                          ],
                        )
                      : const Text(
                          'Continuar',
                          style: TextStyle(fontSize: 28.0),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
