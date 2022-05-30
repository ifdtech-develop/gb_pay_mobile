import 'package:flutter/material.dart';

class AppColors {
  ColorScheme get colors => ColorScheme(
        primary: ColorHelper.fromHex('#00c0ff'),
        secondary: ColorHelper.fromHex('#00c0ff'),
        // primary: ColorHelper.fromHex('#FB8E00'),
        // primaryVariant: ColorHelper.fromHex('#FB6E29'),
        // secondary: ColorHelper.fromHex('#FB2588'),
        // secondaryVariant: ColorHelper.fromHex('#FB3079'),
        surface: Colors.black,
        background: Colors.white,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onBackground: Colors.black,
        onError: Colors.white,
        brightness: Brightness.light,
      );
}

class ColorHelper {
  static Color fromHex(String hex) => Color(
        int.parse(
          hex
              .toLowerCase()
              .replaceAll('0x', '')
              .replaceAll('#', '')
              .padLeft(8, 'f'),
          radix: 16,
        ),
      );
}

class ColorsProject {
  static final blueWhite = Color(0xFF00C0FF);
  static final whiteSilver = Color(0xFF847D7F);
  static final whiteSilverLow = Color(0xFFCBC6C6);
  static final green = Color(0xFF11C76F);
  static final strongGrey = Color(0xFF707070);
  static final lowGrey = Color(0xFF847D7F);
}
