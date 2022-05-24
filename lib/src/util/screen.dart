import 'package:gb_pay_mobile/src/util/colors.dart';
import 'package:gb_pay_mobile/src/util/global_context.dart';
import 'package:flutter/material.dart';

final ValueNotifier<bool> _called = ValueNotifier(false);

mixin Screen on Widget {
  final GlobalContext _context = GlobalContext.I;

  final ColorScheme colors = AppColors().colors;

  NavigatorState get navigator => Navigator.of(_context.context!);

  MediaQueryData get media => MediaQuery.of(_context.context!);

  void initState() {
    _called.value = true;
  }
}
