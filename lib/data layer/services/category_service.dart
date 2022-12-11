import 'package:dio/dio.dart';
import 'api_base_helper.dart';

class CategoryService {
  ApiBaseHelper baseHelper = ApiBaseHelper();

  Future getCategories() async {
    Response? response;
    response = await baseHelper.getRequest(uri: 'api/v1/categories');
    return response;
  }
}
