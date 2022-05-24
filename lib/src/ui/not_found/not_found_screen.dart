import 'package:gb_pay_mobile/src/util/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget with Screen {
  NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                '404',
                style: TextStyle(
                  fontSize: 56,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: CupertinoButton.filled(
                child: const Text('Voltar'),
                onPressed: () => navigator.pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
