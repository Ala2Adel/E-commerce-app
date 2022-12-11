import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants.dart';
import '../../domain layer/product_model.dart';
import '../services/products_service.dart';

class ProductsRepo {
  final ProductServices _prodService = ProductServices();

  Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> products = [];
    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    final response = await _prodService.getProductsByCatId();
    if (response != null && response.statusCode == 200) {
      var list = response.data['results'] as List;
      products = list.map((post) => ProductModel.fromJson(post)).toList();
      sharedPref.setString(Constants.products, products.toString());
    } else {
      debugPrint("---\n Error in getting products + ${(response.data)}");
    }
    return products;
  }

  Future<ProductModel> getProductById(int prodId) async {
    ProductModel products =
        ProductModel(id: 0, name: "name", price: "price", description: "description");

    final response = await _prodService.getProductId(prodId);
    if (response != null && response.statusCode == 200) {
      products = response.data.map((post) => ProductModel.fromJson(post)).toList();
    } else {
      debugPrint("---\n Error in getting product by id + ${(response.data)}");
    }
    return products;
  }
}
