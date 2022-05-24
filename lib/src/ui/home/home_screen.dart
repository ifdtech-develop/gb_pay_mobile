import 'package:gb_pay_mobile/src/component/fennec_colorful_button.dart';
import 'package:gb_pay_mobile/src/constants/routes.dart';
import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';
import 'package:gb_pay_mobile/src/util/screen.dart';
import 'package:gb_pay_mobile/src/util/service_location.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget with Screen {
  final UserEntity user;

  HomeScreen({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> get texts => [
        'Olá, ${widget.user.name.split(' ').first},',
        //'Olá,',
        'Obrigado por se cadastrar!',
        'Bem vindo à Fennec ;)'
      ];

  final textList = ValueNotifier<List<Widget>>(
    List.filled(
      4,
      const SizedBox(
        height: 56,
      ),
    ),
  );

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      addNewText();
    });
  }

  void addNewText() {
    if (currentIndex < texts.length) {
      final text = texts[currentIndex];

      textList.value[currentIndex] = getText(text);

      setState(() {
        currentIndex += 1;
      });
    } else if (currentIndex == texts.length) {
      print("testando 56 homescreen $currentIndex");
      textList.value[currentIndex] = FennecColorfulButton(
          customOnPressed: () async {
            final NavigationService _navigationService =
                locator<NavigationService>();
            _navigationService.navigateTo(AppRouteNames.greetings);
          },
          titulo: "Realizar Login");
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: ValueListenableBuilder<List<Widget>>(
          valueListenable: textList,
          builder: (_, textListValue, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: textListValue,
            );
          },
        ),
      ),
    );
  }

  Widget getText(String text) => FutureBuilder(
        future: Future.delayed(const Duration(microseconds: 100))
            .then((value) => true),
        builder: (context, snapshot) => Container(
          margin: const EdgeInsets.symmetric(
            vertical: 4,
          ),
          height: 48,
          child: AnimatedOpacity(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            onEnd: () {
              Future.delayed(const Duration(seconds: 1))
                  .then((value) => addNewText());
            },
            opacity: snapshot.hasData ? 1 : 0,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ),
      );
}
