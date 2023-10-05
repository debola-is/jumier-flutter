import 'dart:convert';

class ProductVariant {
  final String name;
  final String image;
  final double price;
  final int quantity;
  final String fileStoreId;

  ProductVariant({
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
    required this.fileStoreId,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "price": price,
      "image": image,
      "quantity": quantity,
      "fileStoreId": fileStoreId,
    };
  }

  factory ProductVariant.fromMap(Map<String, dynamic> map) {
    return ProductVariant(
      name: map["name"] ?? '',
      price: map["price"]?.toDouble() ?? 0.0,
      quantity: map["quantity"]?.toInt() ?? 0,
      image: map["image"] ?? [],
      fileStoreId: map["fileStoreId"] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductVariant.fromJson(String source) =>
      ProductVariant.fromMap(json.decode(source));
}
