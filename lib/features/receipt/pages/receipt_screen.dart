import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gb_pay_mobile/features/receipt/pages/receipt_screen.text.dart';
import 'package:gb_pay_mobile/util/colors.dart';
import 'package:gb_pay_mobile/util/screen.dart';
import 'package:intl/intl.dart';

import '../../../models/confirm_payment/confirm_payment_model.dart';
import '../../../models/paymentCard/paymentCard_model.dart';
import '../../../services/confirm_payment.dart';
import '../../../shared/authentication/auth_preferences.dart';
import '../../../shared/code_bar/code_bar_preferences.dart';
import '../../../shared/confirm_payment/confirm_payment_preferences.dart';
import '../../../shared/credit_card/credit_card_data_preferences.dart';
import '../../../shared/new_payment/new_payment_preferences.dart';

class ReceiptScreen extends StatefulWidget with Screen {
  final ConfirmPaymentModel realizePayment;
  ReceiptScreen({Key? key, required this.realizePayment}) : super(key: key);

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  ConfirmPaymentDTO _confirmPaymentSystem = ConfirmPaymentDTO();
  TextEditingController numeroParcelasController = TextEditingController();
  TextEditingController numeroCartaoController = TextEditingController();
  TextEditingController validadeController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfCnpjController = TextEditingController();
  DateTime data = DateTime.now();
  late int paymentStatus;
  late ConfirmPaymentDTO confirm = ConfirmPaymentDTO();

  void initState() {
    paymentStatus = widget.realizePayment.transactionId;
    confirm.confirmPayment(1234, paymentStatus);
    CreditCardPreferencs.setCardNumber('');
    CreditCardPreferencs.setCardHolderDocument('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //PaymentCardModel args = ModalRoute.of(context)!.settings.arguments as PaymentCardModel;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const [
            Text(
              ReceiptScreenText.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme:
            const IconThemeData(color: ColorsProject.blueWhite, size: 40.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 35.0),
              child: SizedBox(
                //height: MediaQuery.of(context).size.height * 0.7,
                // color: Colors.green,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // valor
                      TitleWidget(text: ReceiptScreenText.titulo1),
                      ValueWidget(
                        text: CreditCardPreferencs.getAmountDouble()!
                            .toStringAsFixed(2)
                            .replaceAll('.', ','),
                      ),
                      TitleWidget(text: ReceiptScreenText.valorOriginal),
                      ValueWidget(
                        text: CreditCardPreferencs.getAmountOrigin()!
                            .toString()
                            .replaceAll('.', ','),
                      ),
                      TitleWidget(text: 'Parcelas'),
                      Column(
                        children: [
                          if (CreditCardPreferencs.getInstallments() == 1) ...[
                            ValueWidget(
                              text:
                                  '${CreditCardPreferencs.getInstallments()}' ??
                                      'A vista',
                            ),
                          ] else ...[
                            ValueWidget(
                              text:
                                  '${CreditCardPreferencs.getInstallments()}x de ${CreditCardPreferencs.getParcel().toString().replaceAll('.', ',').substring(0, 5)}',
                            )
                          ]
                        ],
                      ),
                      // Quem vai receber
                      TitleWidget(text: ReceiptScreenText.titulo2),
                      SubTitleWidget(text: ReceiptScreenText.subtitulo2),
                      ValueWidget(text: NewPaymentPreferencs.getAssignor()),
                      // Quem Pagou
                      TitleWidget(text: ReceiptScreenText.titulo3),
                      SubTitleWidget(text: ReceiptScreenText.nomeText),
                      ValueWidget(text: CreditCardPreferencs.getCardHolder()),
                      TitleWidget(text: 'Data de Pagamento'),
                      ValueWidget(
                        text: DateFormat('dd/MM/yyyy' ' - ' 'HH:mm', 'pt_BR')
                            .format(data),
                      ),

                      TitleWidget(text: 'Vencimento'),
                      ValueWidget(
                        text: NewPaymentPreferencs.getDueDate() ??
                            'N??o informado',
                      ),
                      SubTitleWidget(text: ReceiptScreenText.cpfText),
                      ValueWidget(
                          text: CreditCardPreferencs
                              .getCardHolderDocumentUnformated()),
                      TitleWidget(text: 'Autentica????o banc??ria'),
                      ValueWidget(
                        text: '97f529ac-43ab-4be3-9fe7-815e50ef6d79',
                      ),

                      TitleWidget(text: 'Comprovante do Cart??o'),
                      ValueWidget(
                        text: '97f529ac-43ab-4be3-9fe7-815e50ef6d79',
                      ),

                      SubTitleWidget(text: ReceiptScreenText.agenciaText),
                      ValueWidget(
                          text: widget.realizePayment.convenant ??
                              widget.realizePayment.convenant.split(' ')[1] +
                                  ' / ' +
                                  '0 / ' +
                                  widget.realizePayment.convenant
                                      .split(' ')[4]),
                      SubTitleWidget(text: ReceiptScreenText.nsuText),
                      ValueWidget(text: '21212'),
                      SubTitleWidget(text: ReceiptScreenText.codigoText),
                      ValueWidget(text: CodeBarPreferencs.getCodeBarOriginal()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _subtitle(String? text) {
    return Column(
      children: [
        Text(
          text!,
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8.0,
        )
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  final String? text;

  const TitleWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text!,
          style: const TextStyle(
            fontSize: 24.0,
            color: ColorsProject.lowGrey,
          ),
        ),
        SizedBox(
          height: 2.0,
        )
      ],
    );
  }
}

class SubTitleWidget extends StatelessWidget {
  final String? text;

  const SubTitleWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text!,
          style: const TextStyle(
            fontSize: 16.0,
            color: ColorsProject.lowGrey,
          ),
        ),
        SizedBox(
          height: 2.0,
        )
      ],
    );
  }
}

class ValueWidget extends StatelessWidget {
  final String? text;

  const ValueWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text!,
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 16.0,
        )
      ],
    );
  }
}
