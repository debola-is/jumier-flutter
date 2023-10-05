import 'dart:convert';
import 'package:jumier/models/product_variant.dart';
import 'package:jumier/models/rating.dart';

class Product {
  final String name;
  final String brand;
  final String description;
  final double? price;
  final double? oldPrice;
  final int? quantity;
  final String sellerName;
  final List<String> images;
  final String category;
  final String subCategory;
  final String subSubCategory;
  final String timeStamp;
  final String? id;
  final List<Rating>? ratings;
  final List<ProductVariant>? variants;
  final bool isExpressAvailable;
  final String fileStoreId;

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
    required this.timeStamp,
    required this.quantity,
    this.oldPrice,
    this.ratings,
    this.variants,
    required this.isExpressAvailable,
    required this.fileStoreId,
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
      images: List<String>.from(map['images']),
      category: map['category'] ?? '',
      subCategory: map['subCategory'] ?? '',
      subSubCategory: map['subSubCategory'] ?? '',
      timeStamp: map['timeStamp'] ?? '',
      id: map['_id'] ?? '',
      ratings: map['ratings'] != null
          ? List<Rating>.from(
              map['ratings']?.map(
                (x) => Rating.fromMap(x),
              ),
            )
          : [],
      variants: map['variants'] != null
          ? List<ProductVariant>.from(
              map['variants']?.map(
                (x) => ProductVariant.fromMap(x),
              ),
            )
          : [],
      isExpressAvailable: map["isExpressAvailable"] ?? false,
      fileStoreId: map["fileStoreId"] ?? "",
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
    data['timeStamp'] = timeStamp;
    data['_id'] = id;
    data['variants'] = variants;
    data["isExpressAvailable"] = isExpressAvailable;
    data["fileStoreId"] = fileStoreId;

    return data;
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
