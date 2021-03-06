import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gb_pay_mobile/util/colors.dart';

import '../../models/totp/totp_model.dart';

class TokenPage extends StatefulWidget {
  TokenPage({Key? key}) : super(key: key);

  @override
  _TokenScreenState createState() => _TokenScreenState();
}

// TotpRest totp = TotpRest();s
// Token totp = new Token();
ImeiController imei = ImeiController();

//String metodoOtp = metodo(imei).toString();
// ignore: unnecessary_new
//late Future<String> dataTotp = metodo(imei);

class _TokenScreenState extends State<TokenPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> progressAnimation;
  late Animation<Color?> progressColorAnimation;

  // final ValueNotifier<String> _code = dataTotp(imei) as ValueNotifier<String>;

  // This list hold the items of the list view
  //String OTP = metodoOtp;
  // This variable determines whether the timer runs or not
  bool _isRunning = true;
  String? totp;
  // This function will be triggered every 1 second

  void generateNewCode() async {
    // final _list = List.generate(6, (index) => Random().nextInt(10));
    // _code.value = int.parse(_list.join());
    // _code.value = dataTotp(imei).value!;
    // print(_code.value);
  }

  @override
  void initState() {
    generateNewCode();
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 30))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              generateNewCode();
              _animationController.reset();
              _animationController.forward();
            }
          });

    progressAnimation =
        Tween<double>(begin: 1, end: 0).animate(_animationController);

    progressColorAnimation =
        ColorTween(begin: ColorsProject.blueWhite, end: ColorsProject.lowGrey)
            .animate(_animationController);

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    ColorsProject.blueWhite,
                    ColorsProject.lowGrey,
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.grey[500]!,
                        ),
                      ),
                      const SizedBox(height: 36),
                      const Text(
                        'Gera????o de Token',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Utilize o Token no Portal Online',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FutureBuilder<String>(
                                  future: metodo(imei),

                                  // valueListenable: _code,
                                  builder: (ctx, snapshot) {
                                    final data = snapshot.data;
                                    //print("data: ${dataTotp}");
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      // If we got an error
                                      if (snapshot.hasError) {
                                        return const Center(
                                          child: Text(
                                            'Aguarde um pouco',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        );

                                        // if we got our data
                                      } else if (snapshot.hasData) {
                                        print("data: ${snapshot.hasData}");
                                        print(
                                            "data string: ${data.toString()}");
                                        Future.delayed(
                                            const Duration(seconds: 30), () {
                                          setState(() {});
                                        });
                                        return Text(
                                          data.toString(),
                                          style: const TextStyle(
                                            fontSize: 60,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        );
                                      }
                                    }
                                    return Container();
                                  }),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: AnimatedBuilder(
                                  animation: progressAnimation,
                                  builder: (context, _) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: LinearProgressIndicator(
                                        value: progressAnimation.value,
                                        valueColor: progressColorAnimation,
                                        minHeight: 16,
                                        backgroundColor: Colors.grey[300],
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
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
}

class ImeiController extends ChangeNotifier {
  bool permission = false;

  refreshScreen() {
    if (permission == false) {
      permission = true;
      notifyListeners();
      print(refreshScreen());
    }
  }
}
