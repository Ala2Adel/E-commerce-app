import 'dart:convert';

import 'package:dio/dio.dart';

import 'api_base_helper.dart';

class AuthServices {
  ApiBaseHelper baseHelper = ApiBaseHelper();

  Future logIn({required String userName, required String password}) async {
    String body = json.encode({
      "username": userName,
      "password": password,
    });
    Response? response;
    response = await baseHelper.postRequest(uri: 'users/login/', body: body, isToken: false);
    return response;
  }

  Future register({
    required String userName,
    required String email,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    String body = json.encode({
      "username": userName,
      "password": password,
      "email": email,
      "first_name": firstName,
      "last_name": lastName
    });
    Response? response;
    response = await baseHelper.postRequest(uri: 'users/register/', body: body, isToken: false);
    return response;
  }
}
