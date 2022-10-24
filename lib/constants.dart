import 'package:flutter/material.dart';

Color shadeOfBlack = Colors.black.withOpacity(0.85);
Color backgroundGrey = Colors.grey.shade200;
Color shadeOfOrange = const Color.fromRGBO(246, 133, 15, 1);
Color shadeOfBlue = Colors.blue.shade800;
List<String> carouselImages = [
  'assets/carousel_images/carousel1.png',
  'assets/carousel_images/carousel2.png',
  'assets/carousel_images/carousel3.png',
  'assets/carousel_images/carousel4.png',
  'assets/carousel_images/carousel5.png',
];

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

Map<String, List<String>> categoryAndSubCategories = {
  'grocery': [
    'food cupboard',
    'beer wine & spirits',
    'household cleaning',
    'baby products',
  ],
  'health & beauty': [
    'makeup',
    'fragrances',
    'hair care',
    'personal care',
    'oral care',
    'health care',
  ],
  'home & office': [
    'home & kitchen',
    'home & office furniture',
    'office products',
    'small appliances',
    'large appliances',
  ],
  'phones & tablet': [
    'mobile phones',
    'tablets',
    'mobile phone accessories',
  ],
  'computing': [
    'computers',
    'data storage',
    'antivirus & security',
    'printers',
    'computer accessories',
  ],
  'electronics': [
    'television & video',
    'home audio',
    'camera & photo',
    'generators & portable power'
  ],
  'fashion': [
    'men\'s fashion',
    'women\'s fashion',
    'kid\'s fashion',
    'watches',
    'luggage & travel gear',
  ],
  'baby products': [
    'apparel & accessories',
    'diapering',
    'feeding',
    'baby & toddler toys',
    'gear',
    'bathing & skincare',
    'potty training',
    'safety',
  ],
  'gaming': [
    'playstation',
    'xbox',
    'nintendo',
  ],
  'sporting goods': [
    'cardio training',
    'strength & training equipment',
    'accessories',
    'team sports',
    'outdoor & adventure',
  ],
  'automobile': [
    'car care',
    'car electronics & accessories',
    'lights & lighting accessories',
    'exterior accessories',
    'oils & fluids',
    'interior accessories',
    'tyre & rim',
  ],
};
