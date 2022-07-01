import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/routes.dart';
import '../../models/confirm_payment/confirm_payment_model.dart';
import '../../models/paymentCard/paymentCard_model.dart';
import '../../services/confirm_payment.dart';
import '../../services/payment_card_dto.dart';
import '../../services/realize_payment.dart';
import '../../shared/code_bar/code_bar_preferences.dart';
import '../../shared/credit_card/credit_card_data_preferences.dart';
import '../../shared/new_payment/new_payment_preferences.dart';
import '../../shared/summary_preferences/summary_preferences.dart';
import '../../util/colors.dart';
import '../../widgets/loader.dart';
import '../../widgets/messageError_widget.dart';
import 'package:flutter/foundation.dart';

class PaymentSummaryPage extends StatefulWidget {
  const PaymentSummaryPage({Key? key}) : super(key: key);

  @override
  State<PaymentSummaryPage> createState() => _PaymentSummaryPageState();
}

class _PaymentSummaryPageState extends State<PaymentSummaryPage> {
  DateTime data = DateTime.now();
  CreditCardPreferencs creditCard = CreditCardPreferencs();
  PaymentCardDTO _paymentCard = PaymentCardDTO();
  RealizePaymentQuery _confirmPayment = RealizePaymentQuery();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  PaymentCardModel _paymentCardModel = PaymentCardModel();
  final _formKey = GlobalKey<FormState>();
  ConfirmPaymentDTO _confirmPaymentSystem = ConfirmPaymentDTO();
  bool isLoading = false;
  late ConfirmPaymentModel waitPayment;

  @override
  void initState() {
    print(CreditCardPreferencs.getAmountDouble()!);
    print(CreditCardPreferencs.getAmountOrigin()!);
    //waitPayment = waitPayment.
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: const CircularProgressIndicator(
        color: ColorsProject.blueWhite,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(
            'Resumo de Pagamento',
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28.0, 12.0, 28.0, 16.0),
            child: SizedBox(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    FormInputsSummaryTransaction(
                        title: 'Transação:', dataTitle: 1080025246),
                    FormInputsSummaryTransaction(
                        title: 'Data de Pagamento:',
                        dataTitle: DateFormat("dd/MM/yyyy").format(data)),
                    SizedBox(
                      height: 28.0,
                    ),
                    FormInputsSummaryCard(
                        title: 'Final do Cartão de Crédito:',
                        dataTitle: CreditCardPreferencs.getCardNumber()!
                            .substring(12, 16)),
                    FormInputsSummaryCard(
                        title: 'Pgto. Cartão:',
                        dataTitle:
                            'R\$ ${CreditCardPreferencs.getAmountDouble()}'),
                    FormInputsSummaryCard(
                        title: 'Valor do boleto:',
                        dataTitle:
                            'R\$ ${CreditCardPreferencs.getAmountOrigin()?.toString().replaceAll('.', ',')}'),
                    FormInputsSummaryCard(
                        title: 'Total pago:',
                        dataTitle:
                            'R\$ ${CreditCardPreferencs.getAmountDouble()}'),
                    SizedBox(
                      height: 28.0,
                    ),
                    FormInputsSummaryDescription(
                        title: 'Descrição:', dataTitle: 'Descrição do Pgto'),
                    FormInputsSummaryDescription(
                        title: 'Vencimento:', dataTitle: 'Não informado'),
                    FormInputsSummaryDescription(
                        title: 'Beneficiário:', dataTitle: 'Não informado'),
                    FormInputsSummaryDescription(
                        title: 'Pagador:',
                        dataTitle: CreditCardPreferencs.getCardHolder()),
                    FormInputsSummaryDescription(
                        title: 'Documento do Pagador:',
                        dataTitle: CreditCardPreferencs
                            .getCardHolderDocumentUnformated()),
                    FormInputsSummaryDescription(
                        title: 'Valor do documento:',
                        dataTitle:
                            'R\$ ${CreditCardPreferencs.getAmountOrigin()?.toString().replaceAll('.', ',')}'),
                    SizedBox(
                      height: 18.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 25.0,
                      ),
                      child: SizedBox(
                        width: 330.0,
                        height: 60.0,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate() ||
                                isLoading) {
                              setState(() {
                                isLoading = true;
                              });
                              var jsonCode = {};
                              if (CreditCardPreferencs.getInstallments()! !=
                                  1) {
                                jsonCode = {
                                  'card': {
                                    'cardNumber':
                                        CreditCardPreferencs.getCardNumber(),
                                    'cardHolder':
                                        CreditCardPreferencs.getCardHolder(),
                                    'cardHolderDocument': CreditCardPreferencs
                                        .getCardHolderDocument(),
                                    'expirationMonth': CreditCardPreferencs
                                        .getExpirationMonth(),
                                    'expirationYear': CreditCardPreferencs
                                        .getExpirationYear(),
                                    'securityCode':
                                        CreditCardPreferencs.getSecurityCode(),
                                    'brand': CreditCardPreferencs.getBrand(),
                                  },
                                  'payment': {
                                    'documentNumber': CreditCardPreferencs
                                        .getCardHolderDocument(),
                                    'amount': CreditCardPreferencs.getAmount()!*100,
                                    'installments':
                                        CreditCardPreferencs.getInstallments(),
                                  },
                                  'customer': {
                                    'firstName':
                                        CreditCardPreferencs.getCardHolder(),
                                    'lastName':
                                        CreditCardPreferencs.getCardHolder(),
                                    'documentNumber': '76600763000135',
                                  }
                                };
                              } else if (CreditCardPreferencs
                                      .getInstallments()! ==
                                  1) {
                                jsonCode = {
                                  'card': {
                                    'cardNumber':
                                        CreditCardPreferencs.getCardNumber(),
                                    'cardHolder':
                                        CreditCardPreferencs.getCardHolder(),
                                    'cardHolderDocument': CreditCardPreferencs
                                        .getCardHolderDocument(),
                                    'expirationMonth': CreditCardPreferencs
                                        .getExpirationMonth(),
                                    'expirationYear': CreditCardPreferencs
                                        .getExpirationYear(),
                                    'securityCode':
                                        CreditCardPreferencs.getSecurityCode(),
                                    'brand': CreditCardPreferencs.getBrand(),
                                  },
                                  'payment': {
                                    'documentNumber': CreditCardPreferencs
                                        .getCardHolderDocument(),
                                    'amount': CreditCardPreferencs.getAmount()!*100,
                                  },
                                  'customer': {
                                    'firstName':
                                        CreditCardPreferencs.getCardHolder(),
                                    'lastName':
                                        CreditCardPreferencs.getCardHolder(),
                                    'documentNumber': '76600763000135',
                                  }
                                };
                                
                                // print(CreditCardPreferencs
                                //             .getCardHolderDocument()!);
                                // print(CreditCardPreferencs
                                //             .getCardHolderDocument()!);
                                // print(CreditCardPreferencs.getAmountDouble()!);
                                // print(CreditCardPreferencs.getAmountOrigin()!);
                                // print(CreditCardPreferencs.getAmountDouble()! - CreditCardPreferencs.getAmountOrigin()!);
                                // print(CreditCardPreferencs
                                //             .getCardHolderDocument()!);
                                // print(CodeBarPreferencs.getCodeBarType()!);
                                // print(CodeBarPreferencs.getCodeBar()!);
                                // print(CodeBarPreferencs.getCodeBar()!);
                                // print(NewPaymentPreferencs.getDueDate()!);
                                // print(NewPaymentPreferencs.getTransactionId()!);
                               // print(_paymentCardModel.nsu!);
                              }
                              _paymentCard
                                  .payment(jsonCode)
                                  .then((value) async {
                                    print( _paymentCardModel.nsu);
                                await _confirmPayment
                                    .payment(
                                       1234,
                                        CreditCardPreferencs
                                            .getCardHolderDocument()!,
                                        CreditCardPreferencs
                                            .getCardHolderDocument()!,
                                        CreditCardPreferencs.getAmountOrigin()!,
                                        CreditCardPreferencs.getAmountOrigin()!,
                                        0,
                                        CreditCardPreferencs
                                            .getCardHolderDocument()!,
                                        CodeBarPreferencs.getCodeBarType()!,
                                        CodeBarPreferencs.getCodeBar()!,
                                        CodeBarPreferencs.getCodeBar()!,
                                        data,
                                         NewPaymentPreferencs.getTransactionId()!)
                                    .then((value1) => Navigator.pushNamed(
                                        context, AppRouteNames.receipt,
                                        arguments: value1));
                              }
                              );
                            }

                            await Future.delayed(Duration(seconds: 4));
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            primary: ColorsProject.blueWhite,
                            elevation: 0,
                          ),
                          child: const Text(
                            'Pagar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FormInputsSummaryTransaction extends StatelessWidget {
  final String title;
  final dynamic dataTitle;

  const FormInputsSummaryTransaction({
    Key? key,
    required this.title,
    required this.dataTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                '$dataTitle',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
        ],
      ),
    );
  }
}

class FormInputsSummaryCard extends StatelessWidget {
  final String title;
  final dynamic dataTitle;

  const FormInputsSummaryCard({
    Key? key,
    required this.title,
    required this.dataTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                '$dataTitle',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
        ],
      ),
    );
  }
}

class FormInputsSummaryDescription extends StatelessWidget {
  final String title;
  final dynamic dataTitle;

  const FormInputsSummaryDescription({
    Key? key,
    required this.title,
    required this.dataTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                '$dataTitle',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
        ],
      ),
    );
  }
}
