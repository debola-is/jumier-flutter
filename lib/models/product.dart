import 'dart:convert';
import 'package:jumier/models/product_variant.dart';
import 'package:jumier/models/rating.dart';

class Product {
  final String name;
  final String brand;
  final String description;
  final double price;
  final double? oldPrice;
  final int quantity;
  final String sellerName;
  final List<String> images;
  final String category;
  final String subCategory;
  final String subSubCategory;
  final String? id;
  final List<Rating>? ratings;
  final List<ProductVariant>? variants;

  Product({
    required this.name,
    required this.brand,
    required this.description,
    this.id,
    required this.images,
    required this.price,
    required this.sellerName,
    required this.category,
    required this.subCategory,
    required this.subSubCategory,
    required this.quantity,
    this.oldPrice,
    this.ratings,
    this.variants,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      brand: map['brand'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
      oldPrice: map['oldPrice']?.toDouble() ?? 0.0,
      sellerName: map['sellerName'] ?? '',
      images: map['images'] ?? [],
      category: map['category'] ?? '',
      subCategory: map['subCategory'] ?? '',
      subSubCategory: map['subSubCategory'] ?? '',
      id: map['_id'] ?? '',
      ratings: map['ratings'] != null
          ? List<Rating>.from(
              map['ratings']?.map(
                (x) => Rating.fromMap(x),
              ),
            )
          : null,
      variants: map['variants'] != null
          ? List<ProductVariant>.from(
              map['variants']?.map(
                (x) => ProductVariant.fromMap(x),
              ),
            )
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data['name'] = name;
    data['brand'] = brand;
    data['description'] = description;
    data['price'] = price;
    data['quantity'] = quantity;
    data['oldPrice'] = oldPrice;
    data['sellerName'] = sellerName;
    data['images'] = images;
    data['category'] = category;
    data['subCategory'] = subCategory;
    data['subSubCategory'] = subSubCategory;
    data['_id'] = id;
    data['variants'] = variants;
    return data;
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
