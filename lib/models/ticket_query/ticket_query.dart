class TicketQuery {
  String? assignor;
  dynamic? registerData;
  String? documentRecipient;
  String? documentPayer;
  String? payDueDate;
  String? nextBusinessDay;
  String? dueDateRegister;
  bool? allowChangeValue;
  String? recipient;
  String? payer;
  int? discountValue;
  double? interestValueCalculated;
  double? maxValueP;
  double? minValueP;
  int? fineValueCalculated;
  double? originalValue;
  double? totalUpdated;
  double? totalWithDiscount;
  double? totalWithAdditional;
  String? settleDate;
  String? dueDate;
  String? endHour;
  String? initeHour;
  String? nextSettle;
  String? digitable;
  int? transactionId;
  int? type;
  double? value;
  Null? maxValue;
  Null? minValue;
  String? errorCode;
  Null? message;
  int? status;

  TicketQuery({
    this.assignor,
    this.registerData,
    this.documentRecipient,
    this.documentPayer,
    this.payDueDate,
    this.nextBusinessDay,
    this.dueDateRegister,
    this.allowChangeValue,
    this.recipient,
    this.payer,
    this.discountValue,
    this.interestValueCalculated,
    this.maxValueP,
    this.minValueP,
    this.fineValueCalculated,
    this.originalValue,
    this.totalUpdated,
    this.totalWithDiscount,
    this.totalWithAdditional,
    this.settleDate,
    this.dueDate,
    this.endHour,
    this.initeHour,
    this.nextSettle,
    this.digitable,
    this.transactionId,
    this.type,
    this.value,
    this.maxValue,
    this.minValue,
    this.errorCode,
    this.message,
    this.status,
  });

  factory TicketQuery.fromJson(Map<String, dynamic> json) {
    return TicketQuery(
      assignor: json['assignor'],
      registerData: json['registerData'],
      documentRecipient: json['documentRecipient'],
      documentPayer: json['documentPayer'],
      payDueDate: json['payDueDate'],
      nextBusinessDay: json['nextBusinessDay'],
      dueDateRegister: json['dueDateRegister'],
      allowChangeValue: json['allowChangeValue'],
      recipient: json['recipient'],
      payer: json['payer'],
      discountValue: json['discountValue'],
      interestValueCalculated: json['interestValueCalculated'],
      maxValueP: json['maxValue'],
      minValueP: json['minValue'],
      fineValueCalculated: json['fineValueCalculated'],
      originalValue: json['originalValue'],
      totalUpdated: json['totalUpdated'],
      totalWithDiscount: json['totalWithDiscount'],
      totalWithAdditional: json['totalWithAdditional'],
      settleDate: json['settleDate'],
      dueDate: json['dueDate'],
      endHour: json['endHour'],
      initeHour: json['initeHour'],
      nextSettle: json['nextSettle'],
      digitable: json['digitable'],
      transactionId: json['transactionId'],
      type: json['type'],
      value: json['value'],
      maxValue: json['maxValue'] as Null,
      minValue: json['minValue'] as Null,
      errorCode: json['errorCode'],
      message: json['message'] as Null, 
      status: json['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'assignor': assignor,
      'registerData': registerData,
      'documentRecipient': documentRecipient,
      'documentPayer': documentPayer,
      'payDueDate': payDueDate,
      'nextBusinessDay': nextBusinessDay,
      'dueDateRegister': dueDateRegister,
      'allowChangeValue': allowChangeValue,
      'recipient': recipient,
      'payer': payer,
      'discountValue': discountValue,
      'interestValueCalculated': interestValueCalculated,
      'maxValue': maxValueP,
      'minValue': minValueP,
      'fineValueCalculated': fineValueCalculated,
      'originalValue': originalValue,
      'totalUpdated': totalUpdated,
      'totalWithDiscount': totalWithDiscount,
      'totalWithAdditional': totalWithAdditional,
      'settleDate': settleDate,
      'dueDate': dueDate,
      'endHour': endHour,
     'initeHour': initeHour,
      'nextSettle': nextSettle,
      'digitable': digitable,
      'transactionId': transactionId,
      'type': type,
      'value': value,
      'maxValue': maxValue,
      'minValue': minValue,
      'errorCode': errorCode,
      'message': message,
      'status': status,
    };
  }
}
