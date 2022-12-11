import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants.dart';

class ApiBaseHelper {
  late Dio dio;
  String? token = "";

  ApiBaseHelper() {
    BaseOptions options = BaseOptions(baseUrl: Constants.baseUrl, receiveDataWhenStatusError: true);
    dio = Dio(options);
  }

  Future getRequest({required String uri}) async {
    await getToken();
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "JWT $token",
      "Accept": "application/json",
    };
    Response? response;
    try {
      response = await dio.get(
        uri,
        options: Options(
          headers: headers,
        ),
      );
    } catch (e) {
      debugPrint('\n Error in GET method');
      if (e is DioError) {
        debugPrint("${e.response} with type ${e.type}");
        debugPrint("${e.error}");
        response = e.response;
      }
    }
    return response;
  }

  Future postRequest({required String uri, dynamic body, required bool isToken}) async {
    await getToken();

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    Response? response;
    try {
      response = await dio.post(
        uri,
        data: body,
        options: Options(
          headers: headers,
        ),
      );
    } catch (e) {
      debugPrint('\n Error in POST method');
      if (e is DioError) {
        debugPrint("${e.response} with type ${e.type}");
        debugPrint("${e.error}");
        response = e.response;
      }
    }
    return response;
  }

  Future getToken() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    token = sharedPref.getString(Constants.accessToken) ?? '';
  }
}
