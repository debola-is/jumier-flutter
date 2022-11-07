import 'package:flutter/foundation.dart';

class Product {
  String? name;
  String? brand;
  double? price;
  String? sellerName;
  List<String>? images;
  String? category;
  List<String>? subCategories;
  String? id;

  Product({
    this.name,
    this.brand,
    this.id,
    this.images,
    this.price,
    this.sellerName,
    this.category,
    this.subCategories,
  });

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    brand = json['brand'] ?? '';
    price = json['price'] ?? 0;
    sellerName = json['sellerName'] ?? '';
    images = json['images'] ?? [];
    category = json['category'] ?? '';
    subCategories = json['subCategories'] ?? [];
    id = json['_id'] ?? '';
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['name'] = name;
    data['brand'] = brand;
    data['price'] = price;
    data['sellerName'] = sellerName;
    data['images'] = images;
    data['category'] = category;
    data['subCategories'] = subCategories;
    data['_id'] = id;
    return data;
  }
}
