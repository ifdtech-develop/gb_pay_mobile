import 'package:shared_preferences/shared_preferences.dart';

class SummaryPreferencs {
  static late SharedPreferences _preferences;

  static const _keyPaymentId = 'paymentId';
  static const _keyStatus = 'status';
  static const _keyId = 'id';
 

  static Future init() async =>
    _preferences = await SharedPreferences.getInstance();

  static Future setPaymentId(String paymentId) async =>
  await _preferences.setString(_keyPaymentId, paymentId);

  static Future setStatus(String status) async =>
  await _preferences.setString( _keyStatus, status);

  static Future setId(String id) async =>
  await _preferences.setString(_keyId, id);

  static String? getPaymentId() => _preferences.getString(_keyPaymentId);
  static String? getStatus() => _preferences.getString(_keyStatus);
  static String? getId() => _preferences.getString(_keyId);
}