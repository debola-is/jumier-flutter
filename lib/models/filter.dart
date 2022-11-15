import 'dart:convert';

class Filter {
  final String category;
  final String brandName;
  final double minPrice;
  final double maxPrice;
  final double discountPercentage;
  final double ratingMin;
  final double sellerScoreMin;
  final String shippedFrom;
  final String delivery;

  Filter({
    required this.category,
    required this.brandName,
    required this.minPrice,
    required this.maxPrice,
    required this.discountPercentage,
    required this.ratingMin,
    required this.sellerScoreMin,
    required this.shippedFrom,
    required this.delivery,
  });

  factory Filter.fromMap(Map<String, dynamic> map) {
    return Filter(
      category: map['category'] ?? '',
      brandName: map['brandName'] ?? '',
      minPrice: map['minPrice']?.toDouble() ?? 0,
      maxPrice: map['maxPrice']?.toDouble() ?? 99999999999,
      discountPercentage: map['discountPercentage']?.toDouble() ?? 0,
      ratingMin: map['ratingMin']?.toDouble() ?? 0,
      sellerScoreMin: map['sellerScoreMin']?.toDouble() ?? 0,
      shippedFrom: map['shippedFrom'] ?? '',
      delivery: map['delivery'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};
    map['category'] = category;
    map['brandName'] = brandName;
    map['minPrice'] = minPrice;
    map['maxPrice'] = maxPrice;
    map['discountPercentage'] = discountPercentage;
    map['ratingMin'] = ratingMin;
    map['sellerScoreMin'] = sellerScoreMin;
    map['shippedFrom'] = shippedFrom;
    map['delivery'] = delivery;

    return map;
  }

  factory Filter.fromJson(String source) {
    return Filter.fromMap(json.decode(source));
  }

  String toJson() => jsonEncode(toMap());
}
