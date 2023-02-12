import 'dart:convert';
import 'package:jumier/models/product.dart';
import 'package:jumier/models/user.dart';

class Order {
  final User user;
  final List<Product> products;
  final double? totalPrice;
  final String dateCreated;
  final int? status;
  final String? id;

  Order({
    required this.user,
    required this.products,
    this.totalPrice,
    this.id,
    required this.dateCreated,
    this.status,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      user: map['user'] ?? '',
      products: map['products'] ?? [],
      dateCreated: map['dateCreated'] ?? '',
      id: map['_id'] ?? '',
      totalPrice: map['totalPrice']?.toDouble() ?? 0.0,
      status: map['status']?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data['user'] = user;
    data['products'] = products;
    data['dateCreated'] = dateCreated;
    data['totalPrice'] = totalPrice;
    data['status'] = status;
    data['_id'] = id;
    return data;
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
