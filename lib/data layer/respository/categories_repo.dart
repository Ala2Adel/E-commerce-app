import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants.dart';
import '../../domain layer/category_model.dart';
import '../services/category_service.dart';

class CategoriesRepo {
  final CategoryService _catgService = CategoryService();

  Future<List<CategoryModel>> getAllCategories() async {
    List<CategoryModel> products = [];
    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    final response = await _catgService.getCategories();
    if (response != null && response.statusCode == 200) {
      var list = response.data['results'] as List;
      products = list.map((post) => CategoryModel.fromJson(post)).toList();
      sharedPref.setString(Constants.categories, products.toString());
    } else {
      debugPrint("---\n Error in getting categories + ${(response.data)}");
    }
    return products;
  }
}
