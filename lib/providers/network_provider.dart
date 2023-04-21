import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkStatus extends ChangeNotifier {

  bool hasInternet = true;

  checkInternetConnection(){

    InternetConnectionChecker().onStatusChange.listen((status) {
      if(status == InternetConnectionStatus.connected) {
        hasInternet = true;
      }
      else {
        hasInternet = false;
      }
      notifyListeners();
    });
  }
}
