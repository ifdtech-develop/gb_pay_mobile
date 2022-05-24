 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
    
    GetIt locator = GetIt.instance;
    
    class NavigationService {
      final GlobalKey<NavigatorState> navigatorKey =
          new GlobalKey<NavigatorState>();
      Future<dynamic> navigateTo(String routeName) {
        return navigatorKey.currentState!.pushNamed(routeName);
      }
    
      void setupLocator() {
        locator.registerLazySingleton(() => NavigationService());
      }

  void showMyDialog(String titulo, String mensagem) {
    showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) => AlertDialog(
        title: Text(titulo),
        content: Text(mensagem),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            //onPressed: onpressed,

            child: const Text('OK'),
          ),
        ],
      ),);
  }
    }