import 'package:flutter/material.dart';

import '../../domain layer/product_model.dart';
import '../respository/products_repo.dart';

class ShoppingProvider extends ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  final prodRepo = ProductsRepo();

  late ProductModel _product =
      ProductModel(id: 0, name: "name", price: "price", description: "description");

  ProductModel get product => _product;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setProduct(ProductModel data) {
    _product = data;
    notifyListeners();
  }

  Future<void> getProdById(int prodId) async {
    setLoading(true);
    var response = await prodRepo.getProductById(prodId);
    setProduct(response);
    setLoading(false);
  }
}
