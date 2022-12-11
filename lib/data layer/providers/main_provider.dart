import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants.dart';
import '../../domain layer/product_model.dart';
import '../respository/products_repo.dart';

class MainProvider extends ChangeNotifier {
  int _currentIndex = 0;
  bool _loading = false;

  int get currentIndex => _currentIndex;

  bool get loading => _loading;

  final prodRepo = ProductsRepo();

  late List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  updateCurrentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  setProductsList(List<ProductModel> data) {
    _products = data;
    notifyListeners();
  }

  Future<void> getProducts() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var isLoaded = sharedPref.getString(Constants.products);
    if (isLoaded == null) {
      setLoading(true);
      var response = await prodRepo.getAllProducts();
      setProductsList(response);
      setLoading(false);
    } else {
      debugPrint("already loaded list");
    }
  }
}
