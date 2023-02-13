import 'dart:convert';
import 'package:jumier/models/product.dart';

class Order {
  final List<Product> products;
  final List<int> quantity;
  final double totalPrice;
  final int timeOfOrder;
  final int status;
  final String id;
  final String userId;
  final String deliveryAddress;
  // Address string is a combination of  various components: house number, street name, city name and state name. All these components should be joined at the server level by a double percentage sign "%%"

  Order({
    required this.products,
    required this.quantity,
    required this.totalPrice,
    required this.timeOfOrder,
    required this.status,
    required this.id,
    required this.userId,
    required this.deliveryAddress,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      products: List<Product>.from(
        map['products']?.map(
          (x) => Product.fromMap(
            x['product'],
          ),
        ),
      ),
      quantity: List<int>.from(
        map['products']?.map(
          (x) => x['quantity'],
        ),
      ),
      totalPrice: map['totalPrice']?.toDouble() ?? 0.0,
      timeOfOrder: map['timeOfOrder']?.toInt() ?? 0,
      status: map['status']?.toInt() ?? 0,
      id: map['_id'] ?? '',
      userId: map['userId'] ?? '',
      deliveryAddress: map['deliveryAddress'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data['products'] = products.map((e) => e.toMap()).toList();
    data['quantity'] = quantity;
    data['totalPrice'] = totalPrice;
    data['timeOfOrder'] = timeOfOrder;
    data['status'] = status;
    data['_id'] = id;
    return data;
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
