import 'dart:convert';

import 'package:jumier/features/product/filter/filter_screen.dart';

class Filter {
  String? productName;
  double? minPrice;
  double? maxPrice;
  double? discountPercentage;
  double? ratingMin;
  double? sellerScoreMin;
  String? shippedFrom;
  String? delivery;

  Filter({
    this.productName,
    this.minPrice,
    this.maxPrice,
    this.discountPercentage,
    this.ratingMin,
    this.sellerScoreMin,
    this.shippedFrom,
    this.delivery,
  });

  Filter.fromJson(Map<String, dynamic> json) {
    productName = json['productName'] ?? '';
    minPrice = json['minPrice'] ?? 0;
    maxPrice = json['maxPrice'] ?? 99999999999;
    discountPercentage = json['discountPercentage'] ?? 0;
    ratingMin = json['ratingMin'] ?? 0;
    sellerScoreMin = json['sellerScoreMin'] ?? 0;
    shippedFrom = json['shippedFrom'] ?? '';
    delivery = json['delivery'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['productName'] = productName;
    data['minPrice'] = minPrice;
    data['maxPrice'] = maxPrice;
    data['discountPercentage'] = discountPercentage;
    data['ratingMin'] = ratingMin;
    data['sellerScoreMin'] = sellerScoreMin;
    data['shippedFrom'] = shippedFrom;
    data['delivery'] = delivery;

    return data;
  }
}
