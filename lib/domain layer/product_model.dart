import 'category_model.dart';

class ProductModel {
  late int id;
  late String name;
  late String price;
  late String description;
  String? rate;
  CategoryModel? category;
  String? imageLink;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    this.rate,
    this.category,
    this.imageLink,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    rate = json['rate'];
    category = json['category'];
    imageLink = json['image_link'];
  }

  Map<String, dynamic> toJson(ProductModel prodModel) {
    return {
      "id": prodModel.id,
      "name": prodModel.name,
      "price":prodModel.price,
      "description":prodModel.description,
      "rate":prodModel.rate,
      "category":prodModel.category,
      "image_link": prodModel.imageLink,
    };
  }
}
