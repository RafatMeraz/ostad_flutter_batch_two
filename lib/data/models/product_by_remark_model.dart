import 'product.dart';

class ProductByRemarkModel {
  String? msg;
  List<Product>? products;

  ProductByRemarkModel({this.msg, this.products});

  ProductByRemarkModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      products = <Product>[];
      json['data'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.products != null) {
      data['data'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
