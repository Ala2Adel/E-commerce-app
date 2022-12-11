import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/constants.dart';
import '../../domain layer/product_model.dart';
import '../services/products_service.dart';

class ProductsRepo {
  final ProductServices _prodService = ProductServices();

  Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> products = [];
    final response = await _prodService.getProductsByCatId();
    if (response != null && response.statusCode == 200) {
      var list = response.data['results'] as List;
      products = list.map((post) => ProductModel.fromJson(post)).toList();
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      sharedPref.setString(Constants.products, products.toString());
    } else {
      debugPrint("---\n Error in getting products + ${(response.data)}");
    }
    return products;
  }
}
