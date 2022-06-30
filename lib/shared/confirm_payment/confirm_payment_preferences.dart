import 'package:shared_preferences/shared_preferences.dart';

class ConfirmPaymentPreferencs {
  static late SharedPreferences _preferences;

  static const _keyAuthorizationId = 'authorizationId';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setAuthorizationId(String authorizationId) async =>
      await _preferences.setString(_keyAuthorizationId, authorizationId);


  static String? getAuthorizationId() => _preferences.getString(_keyAuthorizationId);
}
