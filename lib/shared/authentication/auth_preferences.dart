import 'package:shared_preferences/shared_preferences.dart';

class AuthPreferencs {
  static late SharedPreferences _preferences;

  static const _keyPaymentId = 'paymentId';
  static const _keyOrderNumber = 'orderNumber';
  static const _keyId = 'id';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setPaymentId(String paymentId) async =>
      await _preferences.setString(_keyPaymentId, paymentId);

  static Future setOrderNumber(String status) async =>
      await _preferences.setString(_keyOrderNumber, status);

  static Future setId(String id) async =>
      await _preferences.setString(_keyId, id);

  static String? getPaymentId() => _preferences.getString(_keyPaymentId);
  static String? getOrderNumber() => _preferences.getString(_keyOrderNumber);
  static String? getId() => _preferences.getString(_keyId);
}
