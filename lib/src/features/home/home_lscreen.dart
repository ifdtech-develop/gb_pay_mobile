import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';
import 'package:gb_pay_mobile/src/util/screen.dart';
import 'package:flutter/material.dart';

class HomeLScreen extends StatefulWidget with Screen {
  final String token;

  HomeLScreen({
    required this.token,
    Key? key,
  }) : super(key: key);

  @override
  State<HomeLScreen> createState() => _HomeLScreenState();
}

class _HomeLScreenState extends State<HomeLScreen> {
  List<String> get texts => [
        'Olá, ',
        'Você está registrado no nosso sistema,',
        'Seu login foi efetuado com sucesso.',
        ';)'
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
