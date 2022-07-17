import 'package:shared_preferences/shared_preferences.dart';

class CodeBarPreferencs {
  static late SharedPreferences _preferences;

  static const _keyCodeBar = 'codeBar';
  static const _keyDigitable = 'digitable';
  static const _keyCodeBarType = 'codeBarType';
  static const _keyCodeBarOriginal = 'codeBarOriginal';
  static const _keyDescription = 'description';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setCodeBar(String codeBar) async =>
      await _preferences.setString(_keyCodeBar, codeBar);

  static Future setDigitable(String digitable) async =>
      await _preferences.setString(_keyDigitable, digitable);

  static Future setCodeBarType(int codeBarType) async =>
      await _preferences.setInt(_keyCodeBarType, codeBarType);

  static Future setDescription(String description) async =>
      await _preferences.setString(_keyDescription, description);

  static Future setCodeBarOriginal(String codeBarOriginal) async =>
      await _preferences.setString(_keyCodeBarOriginal, codeBarOriginal);

  static String? getCodeBar() => _preferences.getString(_keyCodeBar);
  static String? getDigitable() => _preferences.getString(_keyDigitable);
  static int? getCodeBarType() => _preferences.getInt(_keyCodeBarType);
  static String? getCodeBarOriginal() =>
      _preferences.getString(_keyCodeBarOriginal);
  static String? getDescription() => _preferences.getString(_keyDescription);
}
