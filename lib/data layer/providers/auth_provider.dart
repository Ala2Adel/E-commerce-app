import 'package:flutter/material.dart';

import '../respository/auth_repo.dart';

class AuthProvider extends ChangeNotifier {
  bool _passVisible = false;
  bool _confirmPassVisible = false;
  bool _loading = false;
  String _statusCode = "";

  String get statusCode => _statusCode;

  bool get passVisible => _passVisible;

  bool get confirmPassVisible => _confirmPassVisible;

  bool get loading => _loading;
  final authRepo = AuthRepo();

  updatePassVisible(bool value) async {
    _passVisible = value;
    notifyListeners();
  }

  updateConfirmPassVisible(bool value) async {
    _confirmPassVisible = value;
    notifyListeners();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  updateLogin(String data) {
    _statusCode = data;
    notifyListeners();
  }

  Future setLogin({username, password}) async {
    setLoading(true);
    var response = await authRepo.login(password: password, username: username);
    updateLogin(response.statusCode.toString());
    setLoading(false);
  }
}
