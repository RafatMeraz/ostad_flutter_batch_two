import 'category.dart';

class CategoryModel {
  String? msg;
  List<Category>? categories;

  CategoryModel({this.msg, this.categories});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      categories = <Category>[];
      json['data'].forEach((v) {
        categories!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (categories != null) {
      data['data'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}