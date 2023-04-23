import 'package:flutter/material.dart';
import 'package:socool/methods/auth_method.dart';

import '../model/user_model.dart';

class StateProvider with ChangeNotifier {
  final AuthMethods authMethods = AuthMethods();

  UserModel? _user;

  UserModel? get getUser => _user;

  Future<void> refreshUser() async {
    var user = await authMethods.getUserDetails();

    _user = user;

    notifyListeners();
  }
}
