import 'package:flutter/material.dart';

import '../../domain layer/product_model.dart';
import '../respository/products_repo.dart';

class ShoppingProvider extends ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  final prodRepo = ProductsRepo();

  late ProductModel _products =
      ProductModel(id: 0, name: "name", price: "price", description: "description");

  ProductModel get products => _products;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setProduct(ProductModel data) {
    _products = data;
    notifyListeners();
  }

  Future<void> getProdById(int prodId) async {
    setLoading(true);
    var response = await prodRepo.getProductById(prodId);
    setProduct(response);
    setLoading(false);
  }
}
