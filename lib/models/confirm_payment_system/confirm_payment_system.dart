class ConfirmPaymentSystemModel {
  String? errorCode;
  String? message;
  int? status;

 ConfirmPaymentSystemModel({
    this.errorCode,
    this.message,
    this.status,
  });

  factory ConfirmPaymentSystemModel.fromJson(Map<String, dynamic> json) {
    return ConfirmPaymentSystemModel(
      errorCode: json['errorCode'],
      message: json['message'],
      status: json ['status'],
    );
  }
}
