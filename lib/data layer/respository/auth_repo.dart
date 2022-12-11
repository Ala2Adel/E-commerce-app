import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants.dart';
import '../../domain layer/user_model.dart';
import '../services/auth_service.dart';

class AuthRepo {
  final AuthServices _authService = AuthServices();

  Future register({
    required String email,
    required String password,
    required String username,
    required String fName,
    required String lName,
  }) async {
    final response = await _authService.register(
        email: email, password: password, userName: username, firstName: fName, lastName: lName);

    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    if (response != null && response.statusCode == 200) {
      final username = UserModel.fromJson(response.data['user']).userName;
      final fName = UserModel.fromJson(response.data['user']).firstName;
      final lName = UserModel.fromJson(response.data['user']).lastName;
      sharedPref.setString(Constants.userName, username);
      sharedPref.setString(Constants.firstName, fName);
      sharedPref.setString(Constants.lastName, lName);
    } else {
      debugPrint("---\n Error in registering + ${(response.data)}");
    }
    return response;
  }

  Future login({required String password, required String username}) async {
    final response = await _authService.logIn(password: password, userName: username);

    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    if (response != null && response.statusCode == 200) {
      final currToken = response.data['access'];

      sharedPref.setString(Constants.userName, username);
      sharedPref.setString(Constants.accessToken, currToken);
    } else {
      debugPrint("\n --- Error in log in + ${(response.data)}");
    }
    return response;
  }
}
