import 'package:dio/dio.dart';
import 'api_base_helper.dart';

class ProductServices {
  ApiBaseHelper baseHelper = ApiBaseHelper();

  Future getProductsByCatId() async {
    Response? response;
    response = await baseHelper.getRequest(uri: 'api/v1/products/category/5');
    return response;
  }
}
