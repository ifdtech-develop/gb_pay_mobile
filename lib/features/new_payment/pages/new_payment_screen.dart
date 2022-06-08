import 'package:flutter/material.dart';
import 'package:gb_pay_mobile/constants/routes.dart';
import 'package:gb_pay_mobile/models/ticket_query/ticket_query.dart';
import 'package:gb_pay_mobile/util/colors.dart';
import 'package:intl/intl.dart';

import '../../../util/assets.dart';

class NewPaymentPage extends StatefulWidget {
  final TicketQuery ticketInfo;

  const NewPaymentPage({Key? key, required this.ticketInfo}) : super(key: key);

  @override
  State<NewPaymentPage> createState() => _NewPaymentPageState();
}

class _NewPaymentPageState extends State<NewPaymentPage> {
  bool _checkToday = false;
  bool _checkOther = false;
  late String code = '';
  String dateCalendar = '';
  TextEditingController dateController = TextEditingController();
  DateTime data = DateTime.now();

  @override
  void initState() {
    super.initState();
    dateController.addListener(() {
      dateCalendar = DateTime.now().toString();
      //code = arguments['/codeBarPage'];
    });
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Novo Pagamento',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        iconTheme:
            const IconThemeData(color: ColorsProject.blueWhite, size: 40.0),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 64.0,
            ),
            child: Icon(
              Icons.info,
              color: ColorsProject.green,
              size: 32.0,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              _payAccount,
              // _cardParcel,
              _divider,
              // _checkBox,
              // _divider,
              _mountInfoPage,
            ],
          ),
          _continueButton
        ],
      ),
    );
  }

  Widget get _payAccount {
    return Padding(
      padding: const EdgeInsets.only(
        // top: 144.0,
        left: 40.0,
      ),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 56.0,
                height: 56.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: ColorsProject.blueWhite,
                ),
                child: Image.asset(
                  AppAssets.barCodeSmallIcon,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pagar conta',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                  ),
                  child: Text(
                    'R\$ ${widget.ticketInfo.value.toString()}',
                    style: const TextStyle(
                      color: ColorsProject.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _cardParcel {
    return Padding(
      padding: const EdgeInsets.only(
        left: 112.0,
        top: 16.0,
        bottom: 8.0,
      ),
      child: Row(
        children: [
          Column(
            children: const [
              Icon(
                Icons.credit_card,
                color: ColorsProject.blueWhite,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 2.0,
                    left: 2.0,
                  ),
                  child: Text(
                    'Parcelamento:',
                    style: TextStyle(
                      color: ColorsProject.whiteSilver,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Text(
                  '2x de R\$ 5,51',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 48.0,
            ),
            child: Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    AppAssets.arrowIcon,
                  ),
                  iconSize: 20.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _checkBox {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    value: _checkToday,
                    shape: const CircleBorder(),
                    onChanged: (bool? value) {
                      setState(() {
                        _checkToday = value!;
                      });
                    },
                  ),
                  const Text(
                    'Pagar hoje',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ],
              ),
              Text(
                DateFormat("dd/MM/yyyy").format(data),
                style: const TextStyle(fontSize: 20.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    value: _checkOther,
                    shape: const CircleBorder(),
                    onChanged: (bool? value) {
                      setState(() {
                        _checkOther = value!;
                      });
                    },
                  ),
                  const Text(
                    'Agendar',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ],
              ),
              TextButton(
                child: const Text(
                  'Escolher data',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: ColorsProject.blueWhite,
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onPressed: () {
                  Future<void> _selectDate(BuildContext context) async {
                    final DateTime? picked = await showDatePicker(
                      builder: ((context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: ColorsProject
                                  .blueWhite, // header background color
                              onPrimary: Colors.black, // header text color
                              onSurface: Colors.black, // body text color
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                primary: Colors.black, // button text color
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      }),
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null && picked != data) {
                      setState(() {
                        data = picked;
                      });
                    }
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget get _mountInfoPage {
    return Column(
      children: [
        infoPage('Data de pagamento', DateFormat("dd/MM/yyyy").format(data)),
        infoPage('Beneficiário', widget.ticketInfo.assignor),
        infoPage('Vencimento', widget.ticketInfo.dueDate ?? 'Sem Vencimento'),
        infoPage('Forma de pagamento', 'Cartão de crédito'),
        // infoPage('Taxa de conveniência do cartão', 'R\$ 0,40'),
        // infoPage('Taxa de parcelamento', 'R\$ 0,62'),
        // infoPage('Parcelas', '2x de R\$ 5,51'),
      ],
    );
  }

  Widget infoPage(String info, dynamic infoSupply) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25.0,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              info,
              style: const TextStyle(
                fontSize: 16.0,
                color: ColorsProject.whiteSilver,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              '$infoSupply',
              style: const TextStyle(
                fontSize: 12.0,
                color: ColorsProject.whiteSilver,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _divider {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 1.0,
        color: ColorsProject.whiteSilver,
      ),
    );
  }

  Widget get _continueButton {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 25.0,
      ),
      child: SizedBox(
        width: 330.0,
        height: 60.0,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRouteNames.creditcard);
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
            primary: ColorsProject.blueWhite,
            elevation: 0,
          ),
          child: const Text(
            'Próximo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}