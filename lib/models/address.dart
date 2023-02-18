import 'dart:convert';

class Address {
  final String firstName;
  final String lastName;
  final String deliveryAddress;
  String? additionalInfo;
  final String state;
  final String city;
  final String phoneNumber;
  final String? phoneNumber2;

  Address({
    required this.firstName,
    required this.lastName,
    required this.deliveryAddress,
    required this.state,
    required this.city,
    required this.phoneNumber,
    required this.additionalInfo,
    this.phoneNumber2,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'deliveryAddress': deliveryAddress,
      'state': state,
      'city': city,
      'phoneNumber': phoneNumber,
      'phoneNumber2': phoneNumber2,
      'additionalInfo': additionalInfo,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      deliveryAddress: map['deliveryAddress'] ?? '',
      state: map['state'] ?? '',
      city: map['city'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      phoneNumber2: map['phoneNumber2'] ?? '',
      additionalInfo: map['additionalInfo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));
}
