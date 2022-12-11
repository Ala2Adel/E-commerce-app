class CategoryModel {
  late int id;
  late String name;
  String? imageLink;

  CategoryModel({required this.id, required this.name, this.imageLink});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageLink = json['image_link'];
  }

  Map<String, dynamic> toJson(CategoryModel catModel) {
    return {"id": catModel.id, "name": catModel.name, "image_link": catModel.imageLink};
  }
}
