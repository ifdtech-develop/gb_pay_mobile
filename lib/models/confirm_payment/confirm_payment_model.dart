// To parse this JSON data, do
//
//     final confirmPaymentModel = confirmPaymentModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ConfirmPaymentModel confirmPaymentModelFromMap(String str) => ConfirmPaymentModel.fromMap(json.decode(str));

String confirmPaymentModelToMap(ConfirmPaymentModel data) => json.encode(data.toMap());

class ConfirmPaymentModel {
    ConfirmPaymentModel({
        required this.isExpired,
        required this.authentication,
        required this.convenant,
        required this.authenticationApi,
        required this.receipt,
        required this.settleDate,
        required this.createDate,
        required this.transactionId,
        required this.urlreceipt,
        required this.errorCode,
        required this.message,
        required this.status,
    });

    bool isExpired;
    int authentication;
    String convenant;
    AuthenticationApi authenticationApi;
    Receipt receipt;
    DateTime settleDate;
    DateTime createDate;
    int transactionId;
    Null urlreceipt;
    String errorCode;
    Null message;
    int status;

    factory ConfirmPaymentModel.fromMap(Map<String, dynamic> json) => ConfirmPaymentModel(
        isExpired: json["isExpired"],
        authentication: json["authentication"],
        convenant: json["convenant"],
        authenticationApi: AuthenticationApi.fromMap(json["authenticationAPI"]),
        receipt: Receipt.fromMap(json["receipt"]),
        settleDate: DateTime.parse(json["settleDate"]),
        createDate: DateTime.parse(json["createDate"]),
        transactionId: json["transactionId"],
        urlreceipt: json["Urlreceipt"],
        errorCode: json["errorCode"],
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "isExpired": isExpired,
        "authentication": authentication,
        "convenant": convenant,
        "authenticationAPI": authenticationApi.toMap(),
        "receipt": receipt.toMap(),
        "settleDate": settleDate.toIso8601String(),
        "createDate": createDate.toIso8601String(),
        "transactionId": transactionId,
        "Urlreceipt": urlreceipt as Null,
        "errorCode": errorCode,
        "message": message as Null,
        "status": status,
    };
}

class AuthenticationApi {
    AuthenticationApi({
        required this.bloco1,
        required this.bloco2,
        required this.blocoCompleto,
    });

    String bloco1;
    String bloco2;
    String blocoCompleto;

    factory AuthenticationApi.fromMap(Map<String, dynamic> json) => AuthenticationApi(
        bloco1: json["Bloco1"],
        bloco2: json["Bloco2"],
        blocoCompleto: json["BlocoCompleto"],
    );

    Map<String, dynamic> toMap() => {
        "Bloco1": bloco1,
        "Bloco2": bloco2,
        "BlocoCompleto": blocoCompleto,
    };
}

class Receipt {
    Receipt({
        required this.receiptData,
        required this.receiptformatted,
    });

    String receiptData;
    String receiptformatted;

    factory Receipt.fromMap(Map<String, dynamic> json) => Receipt(
        receiptData: json["receiptData"],
        receiptformatted: json["receiptformatted"],
    );

    Map<String, dynamic> toMap() => {
        "receiptData": receiptData,
        "receiptformatted": receiptformatted,
    };
}
