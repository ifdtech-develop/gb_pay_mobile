import 'package:shared_preferences/shared_preferences.dart';

class NewPaymentPreferencs {
  static late SharedPreferences _preferences;

  static const _keyAssignor = 'assignor';
  static const _keyRegisterData = 'registerData';
  static const _keyTransactionId = 'transactionId';
  static const _keyDueDate = 'dueDate';
  static const _keyDueDateFormatted = 'dueDateFormatted';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setAssignor(String? assignor) async =>
      await _preferences.setString(_keyAssignor, assignor!);

  static Future setTransactionId(int? transactionId) async =>
      await _preferences.setInt(_keyTransactionId, transactionId!);

  static Future setDueDate(String? dueDate) async =>
      await _preferences.setString(_keyDueDate, dueDate.toString());

  static Future setDueDateFormatted(DateTime? dueDateFormatted) async =>
      await _preferences.setString(
          _keyDueDateFormatted, dueDateFormatted!.toString());

  static String? getAssignor() => _preferences.getString(_keyAssignor);
  static String? getRegisterData() => _preferences.getString(_keyRegisterData);
  static int? getTransactionId() => _preferences.getInt(_keyTransactionId);
  static String? getDueDate() => _preferences.getString(_keyDueDate);
  static String? getDueDateFormatted() =>
      _preferences.getString(_keyDueDateFormatted);
}
