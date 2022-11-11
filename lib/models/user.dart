import 'package:jumier/models/product.dart';

class User {
  final String firstName;
  final String middleName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String address;
  final String token;
  final String id;
  final List<Product> cart;

  User({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.token,
    required this.id,
    required this.cart,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'] ?? '',
      middleName: map['middleName'] ?? '',
      lastName: map['lastName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',
      token: map['token'] ?? '',
      id: map['_id'] ?? '',
      cart: map['cart'],
    );
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data['firstName'] = firstName;
    data['middleName'] = middleName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['address'] = address;
    data['token'] = token;
    data['id'] = id;
    data['cart'] = cart;
    return data;
  }
}
