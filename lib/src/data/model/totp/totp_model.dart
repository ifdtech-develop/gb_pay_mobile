// import 'package:device_information/device_information.dart';
import 'dart:io';

import 'package:base32/base32.dart';
import 'package:dartz/dartz.dart';
import 'package:device_information/device_information.dart';
import 'package:gb_pay_mobile/src/constants/single.dart';
import 'package:gb_pay_mobile/src/domain/entity/user_entity.dart';
import 'package:gb_pay_mobile/src/ui/token/token_screen.dart';
import 'package:gb_pay_mobile/src/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:macadress_gen/macadress_gen.dart';
import 'package:ootp/ootp.dart';
// import 'package:permission_asker/permission_asker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String? deviceId;
String? mac;
String? imeiNo;
MacadressGen macadressGen = MacadressGen();

class TotpRest {
  late String? tell;
  late String? name;
  late String? email;

  TotpRest({this.tell, this.name, this.email});

  // print(user.phone);

  Future<http.Response> getTotp(String tell, String name, String email) async {
    // String url = 'http://3.12.107.115:5000/v1/api/create';
    String? deviceId = await PlatformDeviceId.getDeviceId;

    String? imeiNo;
    if (Platform.isAndroid) {
      if (await Permission.phone.request().isGranted) {
        String imeiNo = await DeviceInformation.deviceIMEINumber;
        print("imeiNo: ${imeiNo}");
        imei.refreshScreen();

        // return imeiNo;
      } else {
        String imeiNo = "";
      }
      print("android");
    }

    print("URL: ${kTotpURL}");
    print(deviceId);
    print(tell);
    print(name);
    print(mac);
    print(imeiNo);
    return http.post(Uri.parse(kTotpURL + "/v1/api/create"),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
        },
        body: json.encode({
          "deviceId": deviceId,
          "tell": tell,
          "name": name,
          "email": email,
          "mac": null,
          "imei": imeiNo
        }));
  }

// await getTotp();

  String? id = deviceId;
  Future<String> fetchTotpDTO(String tell, String name, String email) async {
    print('fetch para tell: ' + tell);
    // Se nao houver conexao rede o comando abaixo vai gerar uma excessao. Essa excessao deve subir
    final response;
    try {
      print("testando response");
      response = await getTotp(tell, name, email);
    } on Exception catch (e) {
      print("erro aqui: ${e}");
      throw ErrorDescription(e.toString());
    }
    print("status totp: ${response.statusCode}");

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print('mostrando body');
      // print(response.body);
      String tokenTotp = jsonDecode(utf8.decode(response.bodyBytes))['message'];
      print("TOTP token: ${tokenTotp}");

      // return //TokenDTO.fromJson(jsonDecode(response.body));
      // return TotpModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return tokenTotp;
    } else if (response.statusCode == 406) {
      return "Não autorizado, verifique seu token";
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.body);
      throw 'Erro ao Fazer Login';
    }
  }
}

Future<String> metodo(ImeiController imei) async {
  deviceId = await PlatformDeviceId.getDeviceId;

  final secret = base32.encodeString(deviceId as String);
  print('deviceid: $deviceId');

  final convert = secret.replaceAll("=", "");
  final decoded = base32.decode(convert);
  // final otpAuthUri =
  //     "otpauth://totp/OOTP:Tester?secret=${encodedSecret}&issuer=OOTP&period=${totp.period}&digits=${totp.digits}";
  final totp = TOTP.secret(decoded);
  String opa = totp.make();
  // mac = await macadressGen.getMac();
  print("ID: ${convert}");
  print("Token: ${totp.make()}");
  // print("mac: ${mac}");

  return opa;
}

Future<http.Response> recoveryTOTP() async {
  // String url = 'http://3.12.107.115:5000/v1/api/create';

  String? deviceId = await PlatformDeviceId.getDeviceId;

  final s = Singleton;
  return http.post(Uri.parse(kTotpURL + "/v1/api/update2"),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
      },
      body: json.encode({
        "newToken": deviceId,
        "jwt": s.jwtoken,
        "email": s.email,
      }));
}
