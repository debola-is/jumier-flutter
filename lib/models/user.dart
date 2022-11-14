import 'package:jumier/models/product.dart';

class User {
  final String firstName;
  final String middleName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final List<String> addresses;
  final String token;
  final String id;
  final List<Product>? cart;
  final List<Product>? recentlyViewed;
  final List<Product>? savedItems;

  User({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.addresses,
    required this.token,
    required this.id,
    required this.cart,
    required this.recentlyViewed,
    required this.savedItems,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'] ?? '',
      middleName: map['middleName'] ?? '',
      lastName: map['lastName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      email: map['email'] ?? '',
      addresses: map['addresses'] ?? [],
      token: map['token'] ?? '',
      id: map['_id'] ?? '',
      cart: map['cart'] != null
          ? List<Product>.from(
              map['cart']?.map(
                (x) => Product.fromMap(x),
              ),
            )
          : null,
      recentlyViewed: map['recentlyViewed'] != null
          ? List<Product>.from(
              map['cart']?.map(
                (x) => Product.fromMap(x),
              ),
            )
          : null,
      savedItems: map['savedItems'] != null
          ? List<Product>.from(
              map['cart']?.map(
                (x) => Product.fromMap(x),
              ),
            )
          : null,
    );
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data['firstName'] = firstName;
    data['middleName'] = middleName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['addresses'] = addresses;
    data['token'] = token;
    data['id'] = id;
    data['cart'] = cart;
    return data;
  }
}
