
// Model/Pojo class
class ProductListModel {
  String? status;
  List<Product>? productList;

  ProductListModel({this.status, this.productList});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      productList = <Product>[];
      json['data'].forEach((v) {
        productList!.add(Product.fromJson(v));
      });
    }
  }
}

class Product {
  String? createdDate;
  String? sId;
  int? id;
  String? title;
  String? price;
  String? specialPrice;
  String? image;
  String? category;
  String? subcategory;
  String? remark;
  String? brand;
  String? shop;
  String? shopName;
  String? star;
  String? productCode;
  String? stock;
  String? productName;
  String? img;
  String? unitPrice;
  String? qty;
  String? totalPrice;

  Product(
      {this.createdDate,
        this.sId,
        this.id,
        this.title,
        this.price,
        this.specialPrice,
        this.image,
        this.category,
        this.subcategory,
        this.remark,
        this.brand,
        this.shop,
        this.shopName,
        this.star,
        this.productCode,
        this.stock,
        this.productName,
        this.img,
        this.unitPrice,
        this.qty,
        this.totalPrice});

  Product.fromJson(Map<String, dynamic> json) {
    createdDate = json['CreatedDate'];
    sId = json['_id'];
    id = json['id'];
    title = json['title'];
    price = json['price'];
    specialPrice = json['special_price'];
    image = json['image'];
    category = json['category'];
    subcategory = json['subcategory'];
    remark = json['remark'];
    brand = json['brand'];
    shop = json['shop'];
    shopName = json['shop_name'];
    star = json['star'];
    productCode = json['product_code'];
    stock = json['stock'];
    productName = json['ProductName'];
    productCode = json['ProductCode'];
    img = json['Img'];
    unitPrice = json['UnitPrice'];
    qty = json['Qty'];
    totalPrice = json['TotalPrice'];
  }
}
