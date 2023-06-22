import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumier/features/feed/screens/feed_screen.dart';
import 'package:jumier/features/help/screens/help_screen.dart';
import 'package:jumier/features/home/screens/category_screen.dart';
import 'package:jumier/features/home/screens/home_screen.dart';
import 'package:jumier/features/user/screens/account_screen.dart';

String serverUrl = "http://localhost:3000";

Color shadeOfBlack = Colors.black.withOpacity(0.85);
Color backgroundGrey = Colors.grey.shade100;
Color shadeOfOrange = const Color.fromRGBO(251, 178, 21, 1);
Color shadeOfBlue = Colors.blue.shade800;
Color shadeOfGrey = const Color.fromRGBO(245, 245, 245, 1);
Color shadeOfRed = const Color.fromRGBO(236, 28, 36, 1);
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

Map<String, List> generalHomeCategories = {
  'Home': [
    const HomeScreen(),
    Icons.home_outlined,
  ],
  'Categories': [
    const CategoryScreen(),
    Icons.list_alt_outlined,
  ],
  'Feed': [
    const FeedScreen(),
    FontAwesomeIcons.squareRss,
  ],
  'Account': [
    const AccountScreen(),
    Icons.person,
  ],
  'Help': [const HelpScreen(), Icons.help_outline],
};

Map<String, Map<String, List<String>>> categoryAndSubCategories = {
  'grocery': {
    'food cupboard': [
      'rice & grains',
      'pasta',
      'noodles',
      'breakfast foods',
      'herbs, spices & seasonings',
      'flours & meals',
      'malt drinks',
      'coffee',
      'water',
      'cooking oil',
      'juices',
      'soft drinks',
      'canned, jarred & packaged foods',
      'candy & chocolate',
      'syrups, sugars & sweeteners',
    ],
    'beer wine & spirits': [
      'beers',
      'vodka',
      'red wine',
      'champagne & sparkling wine',
      'white wine',
      'whiskey',
      'liquor',
    ],
    'household cleaning': [
      'laundry',
      'toilet paper, wipes & sprays',
      'disinfectant wipes',
      'dishwashing',
      'bathroom cleaners',
      'air fresheners',
    ],
    'baby products': [
      'disposable diapers',
      'bottle-feeding',
      'wipes and refills',
    ],
  },
  'health & beauty': {
    'makeup': [
      'concealers & color corrector',
      'foundation',
      'powder',
      'lip gloss',
      'lip liner',
      'lipstick',
      'eyeliner & kajal',
      'eyeshadow',
      'mascara',
    ],
    'fragrances': [
      'men\'s',
      'women\'s',
    ],
    'hair care': [
      'hair & scalp care',
      'hair accessories',
      'hair cutting tools',
      'shampoo & conditioner',
      'wigs & accessories',
    ],
    'personal care': [
      'feminine care',
      'contraceptives & lubricants',
      'body',
    ],
    'oral care': [
      'dental care kits',
      'dental floss & picks',
      'teeth whitening',
      'toothbrushes',
      'toothpaste',
      'breath fresheners',
    ],
    'health care': [
      'face protection',
      'thermometers',
      'hand sanitizers',
      'lab, safety & work gloves',
    ],
  },
  'home & office': {
    'home & kitchen': [
      'bath',
      'bedding',
      'home decor',
      'home furniture',
      'vacuums & floor care',
      'wall art',
      'cookware',
      'small appliances',
      'bakeware',
      'cutlery & knife accessories',
    ],
    'home & office furniture': [
      'kitchen & dining',
      'lighting',
      'stationery',
      'storage & orginisation',
    ],
    'office products': [
      'office & school supplies',
      'office furnniture & lighting',
      'packaging materials',
    ],
    'small appliances': [
      'ironing & laundry',
      'kettles',
      'mixing & blending',
      'vacuum cleaners',
      'kitchen bundle',
    ],
    'large appliances': [
      'air conditioners & accessories',
      'dishwashers',
      'cookers',
      'household fans',
      'refrigerators',
      'freezers',
    ],
  },
  'phones & tablet': {
    'mobile phones': [
      'smartphones',
      'basic phones',
    ],
    'tablets': [
      'android tablets',
      'educational tablets',
      'tablet accessories',
      'ipads',
    ],
    'mobile phone accessories': [
      'accessory kits',
      'adapters',
      'batteries',
      'battery chargers',
      'bluetooth headsets',
      'cables',
      'car accessories',
      'cases',
      'chargers',
      'earphones & headsets',
      'microSD cards',
      'screen protectors',
      'selfie sticks & tripods',
      'smart watches',
    ],
  },
  'computing': {
    'computers': [
      'desktops',
      'laptops',
      'monitors',
    ],
    'data storage': [
      'external hard drives',
      'USB flash drives',
      'external solid state drives',
    ],
    'antivirus & security': [
      'antivirus',
      'internet security',
    ],
    'printers': [
      'inkjet printers',
      'laser printers',
      'printer ink & toner',
    ],
    'computer accessories': [
      'keyboards, mice & accessories',
      'uninterrupted power supply (UPS)',
      'memory cards',
      'batteries',
      'scanners',
      'video projectors',
    ],
  },
  'electronics': {
    'television & video': [
      'televisions',
      'QLED & OLED TVs',
      'LED & LCD TVs',
      'smart TVs',
      'DVD players & recorders',
    ],
    'home audio': [
      'home theatre systems',
      'receivers & amplifiers',
      'sound bars',
    ],
    'camera & photo': [
      'digital cameras',
      'projectors',
      'video surveillance',
      'camcoders',
    ],
    'generators & portable power': [
      'generators',
      'power inverters',
      'solar & wind power',
      'stabilizers',
    ],
  },
  'fashion': {
    'men\'s fashion': [
      'bags',
      'big & tall',
      'clothing',
      'jewelry',
      'men\'s accessories',
      'shoes',
      'traditional & cultural wear',
      'underwear & sleepwear',
      'watches',
      't-shirts',
    ],
    'women\'s fashion': [
      'clothing',
      'handbags and wallets',
      'jewelry',
      'maternity',
      'plus-size',
      'shoes',
      'women\'s accessories',
    ],
    'kid\'s fashion': [
      'boys',
      'girls',
    ],
    'watches': [
      'men\'s watches',
      'women\'s watches',
      'unisex watches',
    ],
    'luggage & travel gear': [
      'backpacks',
      'briefcases',
      'gym bags',
      'laptop bags',
      'luggage',
      'messenger bags',
      'travel accessories',
      'travel duffels',
      'travel totes',
      'umbrellas',
      'waist packs',
    ],
  },
  'baby products': {
    'apparel & accessories': [
      'baby boys',
      'baby girls',
    ],
    'diapering': [
      'dispoasable diapers',
      'diaper bags',
      'wipes & holders',
      'cloth diapers',
      'changing tables',
    ],
    'feeding': [
      'bibs & burp cloths',
      'bottle-feeding',
      'breastfeeding',
      'food storage',
      'highchairs & booster seats',
      'pacifiers & accessories',
      'solid feeding',
    ],
    'baby & toddler toys': [
      'bath toys',
      'music & sound',
      'learning & education',
    ],
    'gear': [
      'backpacks & carriers',
      'swings, jumpers & bouncers',
      'walkers',
    ],
    'bathing & skincare': [
      'skin care',
      'washcloths & towels',
      'bathing tubs & seats',
      'grooming & healthcare kits',
    ],
    'potty training': [
      'potties & seats',
      'seat covers',
      'training pants',
    ],
    'safety': ['monitors', 'rails & rail guards', 'edge & corner guards'],
  },
  'gaming': {
    'playstation': [
      'playstation 4',
      'playstation 3',
      'playstation 2',
      'playstation',
      'playstation vita',
    ],
    'xbox': [
      'xbox one',
      'xbox 360',
      'xbox',
      'accessories',
    ],
    'nintendo': [
      'nintendo 3DS',
      'nintendo DS',
      'nintendo switch',
      'wii',
    ],
  },
  'sporting goods': {
    'cardio training': [
      'exercise bikes',
      'treadmills',
      'elliptical trainers',
    ],
    'strength & training equipment': [
      'core & abdominal trainers',
      'dumbbells',
      'bars',
    ],
    'accessories': [
      'exercise bands',
      'exercise mats',
      'jump ropes',
      'sport clothing',
    ],
    'team sports': [
      'basketball',
      'team sport accessories',
      'tennis & racket sports',
      'swimming',
    ],
    'outdoor & adventure': [
      'cycling',
      'running',
    ],
  },
  'automobile': {
    'car care': [
      'cleaning kits',
      'exterior care',
      'interior care',
    ],
    'car electronics & accessories': [
      'car electronics',
      'car electronics accessories',
    ],
    'lights & lighting accessories': [
      'bulbs',
      'accent & off road lighting',
    ],
    'exterior accessories': [
      'bumper stickers, decals & magnets',
      'covers',
      'mirrors',
    ],
    'oils & fluids': [
      'brake fluids',
      'greases & lubircants',
      'oils',
    ],
    'interior accessories': [
      'air fresheners',
      'console & organinsers',
      'cup holders',
      'floor mats & cargo liners',
      'key chains',
      'seat covers & accessories',
      'sun protection',
    ],
    'tyre & rim': [
      'tyre',
      'inflator & guages',
    ],
  },
};
