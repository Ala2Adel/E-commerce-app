import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _passVisible = false;
  bool _confirmPassVisible = false;

  bool get passVisible => _passVisible;
  bool get confirmPassVisible => _confirmPassVisible;

  updatePassVisible(bool value) async {
    _passVisible = value;
    notifyListeners();
  }

  updateConfirmPassVisible(bool value) async {
    _confirmPassVisible = value;
    notifyListeners();
  }
}
