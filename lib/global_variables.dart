import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumier/features/feed/screens/feed_screen.dart';
import 'package:jumier/features/help/screens/help_screen.dart';
import 'package:jumier/features/home/screens/category_screen.dart';
import 'package:jumier/features/home/screens/home_screen.dart';
import 'package:jumier/features/user/screens/account_screen.dart';

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

Map<String, Map<String, List<String>>> categoryStructure = {
  'grocery': {
    'food cupboard': [
      'rice & grains#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FfoodCupboard%2FriceAndGrains.jpeg?alt=media',
      'pasta#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FfoodCupboard%2Fpasta.png?alt=media',
      'noodles#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FfoodCupboard%2Fnoodles.png?alt=media',
      'breakfast foods#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FfoodCupboard%2FbreakfastFoods.jpg?alt=media',
      'herbs, spices & seasonings#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FfoodCupboard%2FherbsSpicesAndSeasonings.jpg?alt=media',
      'flours & meals#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FfoodCupboard%2FfloursAndMeals.jpg?alt=media',
      'malt drinks#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FfoodCupboard%2FmaltDrinks.png?alt=media',
      'coffee#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FfoodCupboard%2Fcoffee.png?alt=media',
      'water#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FfoodCupboard%2Fwater.jpg?alt=media',
      'cooking oil#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FfoodCupboard%2FcookingOils.png?alt=media',
      'juices#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FfoodCupboard%2Fjuices.jpg?alt=media',
      'soft drinks#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FfoodCupboard%2FsoftDrinks.jpg?alt=media',
      'canned, jarred & packaged foods#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FfoodCupboard%2FcannedJarredPackaged.jpg?alt=media',
      'candy & chocolate#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FfoodCupboard%2Fchocolate.jpg?alt=media',
      'syrups, sugars & sweeteners#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FfoodCupboard%2FsyrupSweetners.jpg?alt=media',
    ],
    'beer wine & spirits': [
      'beers#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FbeersWineSpirit%2Fbeer.jpg?alt=media',
      'vodka#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FbeersWineSpirit%2Fvodka.jpg?alt=media',
      'red wine#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FbeersWineSpirit%2FredWine.jpg?alt=media',
      'champagne & sparkling wine#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FbeersWineSpirit%2FchampagneSparklingWhine.jpg?alt=media',
      'white wine#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FbeersWineSpirit%2FwhiteWine.jpg?alt=media',
      'whiskey#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FbeersWineSpirit%2Fwhiskey.jpg?alt=media',
      'liquor#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FbeersWineSpirit%2Fliquor.jpg?alt=media',
    ],
    'household cleaning': [
      'laundry#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhouseholdCleaning%2Flaundry.jpg?alt=media',
      'toilet paper, wipes & sprays#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhouseholdCleaning%2FtoiletPaperWipes.png?alt=media',
      'disinfectant wipes#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhouseholdCleaning%2FdisinfectantWipes.png?alt=media',
      'dishwashing#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhouseholdCleaning%2Fdishwashing.jpg?alt=media',
      'bathroom cleaners#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhouseholdCleaning%2FbathroomCleaners.jpg?alt=media',
      'air fresheners#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhouseholdCleaning%2FairFresheners.jpg?alt=media',
    ],
    'baby products': [
      'disposable diapers#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FbabyProducts%2FdisposableDiapers.jpg?alt=media',
      'bottle-feeding#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FbabyProducts%2Fbottle-feeding.jpg?alt=media',
      'wipes and refills#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FbabyProducts%2Fwipes.jpg?alt=media',
    ],
  },
  'health & beauty': {
    'makeup': [
      'concealers & color corrector#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhealthAndBeauty%2Fmakeup%2Fconcealers.jpg?alt=media',
      'foundation#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhealthAndBeauty%2Fmakeup%2Ffoundations.png?alt=media',
      'powder#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhealthAndBeauty%2Fmakeup%2Fpowder.jpg?alt=media',
      'lip gloss#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhealthAndBeauty%2Fmakeup%2FlipGloss.jpg?alt=media',
      'lip liner#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhealthAndBeauty%2Fmakeup%2FlipLiner.jpg?alt=media',
      'lipstick#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhealthAndBeauty%2Fmakeup%2FlipStick.jpg?alt=media',
      'eyeliner & kajal#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhealthAndBeauty%2Fmakeup%2FeyeLiner.jpeg?alt=media',
      'eyeshadow#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhealthAndBeauty%2Fmakeup%2FeyeShadow.jpg?alt=media',
      'mascara#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhealthAndBeauty%2Fmakeup%2Fmascara.jpg?alt=media',
    ],
    'fragrances': [
      'men\'s#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhealthAndBeauty%2Ffragrances%2Fmens.jpg?alt=media',
      'women\'s#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhealthAndBeauty%2Ffragrances%2Fwomens.jpg?alt=media',
    ],
    'hair care': [
      'hair & scalp care#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhairCare%2FhairAndScalpCare.jpg?alt=media',
      'hair accessories#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhairCare%2FhairAccessories.jpg?alt=media',
      'hair cutting tools#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhairCare%2FhairCuttingTools.jpeg?alt=media',
      'shampoo & conditioner#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhairCare%2Fshampoo.jpg?alt=media',
      'wigs & accessories#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhairCare%2Fwigs.jpg?alt=media',
    ],
    'personal care': [
      'feminine care#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FpersonalCare%2FfeminineCare.jpg?alt=media',
      'contraceptives & lubricants#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FpersonalCare%2Fcontraceptives.jpg?alt=media',
      'body#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FpersonalCare%2Fbody.jpg?alt=media',
    ],
    'oral care': [
      'dental care kits#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2ForalCare%2FdentalCareKits.jpg?alt=media',
      'dental floss & picks#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2ForalCare%2FdentalFlossPicks.jpg?alt=media',
      'teeth whitening#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2ForalCare%2FteethWhitening.jpg?alt=media',
      'toothbrushes#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2ForalCare%2FtoothBrushes.jpg?alt=media',
      'toothpaste#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2ForalCare%2FtoothPaste.jpg?alt=media',
      'breath fresheners#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2ForalCare%2FbreathFresheners.jpeg?alt=media',
    ],
    'health care': [
      'face protection#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhealthCare%2FfaceProtection.jpg?alt=media',
      'thermometers#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhealthCare%2Fthermometers.jpg?alt=media',
      'hand sanitizers#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhealthCare%2FhandSanitizer.png?alt=media',
      'lab, safety & work gloves#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhealthCare%2FhandSafetyGloves.jpeg?alt=media',
    ],
  },
  'home & office': {
    'home & kitchen': [
      'bath#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhomeAndKitchen%2Fbath.jpg?alt=media',
      'bedding#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhomeAndKitchen%2Fbedding.jpg?alt=media',
      'home decor#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhomeAndKitchen%2FhomeDecor.jpg?alt=media',
      'home furniture#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhomeAndKitchen%2FhomeFurniture.jpg?alt=media',
      'vacuums & floor care#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhomeAndKitchen%2FvacuumsFloorCare.jpg?alt=media',
      'wall art#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhomeAndKitchen%2FwallArt.jpg?alt=media',
      'cookware#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhomeAndKitchen%2Fcookware.jpg?alt=media',
      'small appliances#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhomeAndKitchen%2FsmallAppliances.jpg?alt=media',
      'bakeware#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhomeAndKitchen%2Fbakeware.jpg?alt=media',
      'cutlery & knife accessories#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhomeAndKitchen%2FcutleryAndKnives.jpg?alt=media',
    ],
    'home & office furniture': [
      'kitchen & dining#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhomeAndOfficeFurniture%2FkitchenDining.jpg?alt=media',
      'lighting#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhomeAndOfficeFurniture%2Flighting.jpg?alt=media',
      'stationery#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhomeAndOfficeFurniture%2Fstationery.jpg?alt=media',
      'storage & orginisation#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FhomeAndOfficeFurniture%2FstorageAndOrganisation.jpeg?alt=media',
    ],
    'office products': [
      'office & school supplies#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FofficeProducts%2FofficeSchoolSupplies.jpg?alt=media',
      'office furnniture & lighting#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FofficeProducts%2FofficeFurniture.jpg?alt=media',
      'packaging materials#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FofficeProducts%2FpackagingMaterials.jpg?alt=media',
    ],
    'small appliances': [
      'ironing & laundry#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FsmallAppliances%2FironingLaundry.jpg?alt=media',
      'kettles#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FsmallAppliances%2Fkettles.jpg?alt=media',
      'mixing & blending#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FsmallAppliances%2FmixingBlending.jpg?alt=media',
      'vacuum cleaners#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FsmallAppliances%2FvacuumCleaners.jpg?alt=media',
      'kitchen bundle#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FsmallAppliances%2FkitchenBundle.jpg?alt=media',
    ],
    'large appliances': [
      'air conditioners & accessories#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FlargeAppliances%2FairConditioners.jpg?alt=media',
      'dishwashers#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FlargeAppliances%2FdishWashers.jpg?alt=media',
      'cookers#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FlargeAppliances%2Fcookers.jpg?alt=media',
      'household fans#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FlargeAppliances%2FhouseholdFans.jpg?alt=media',
      'refrigerators#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FlargeAppliances%2Frefrigerators.jpg?alt=media',
      'freezers#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FlargeAppliances%2Ffreezers.jpg?alt=media',
    ],
  },
  'phones & tablet': {
    'mobile phones': [
      'smartphones#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FmobilePhones%2Fsmartphones.jpg?alt=media',
      'basic phones#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FmobilePhones%2FbasicPhones.jpeg?alt=media',
    ],
    'tablets': [
      'android tablets#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2Ftablets%2FandroidTablets.png?alt=media',
      'educational tablets#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2Ftablets%2FeducationalTablets.jpg?alt=media',
      'tablet accessories#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2Ftablets%2FtabletAccessories.jpg?alt=media',
      'ipads#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2Ftablets%2Fipads.png?alt=media',
    ],
    'mobile phone accessories': [
      'accessory kits#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FmobilePhoneAccessories%2FaccessoriesKit.jpg?alt=media',
      'adapters#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FmobilePhoneAccessories%2Fadapters.jpg?alt=media',
      'batteries#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FmobilePhoneAccessories%2Fbatteries.jpg?alt=media',
      'battery chargers#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FmobilePhoneAccessories%2FbatteryChargers.jpg?alt=media',
      'bluetooth headsets#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FmobilePhoneAccessories%2FbluetoothHeadsets.jpg?alt=media',
      'cables#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FmobilePhoneAccessories%2Fcables.jpg?alt=media',
      'car accessories#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FmobilePhoneAccessories%2FcarAccessories.png?alt=media',
      'cases#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FmobilePhoneAccessories%2Fcases.jpg?alt=media',
      'chargers#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FmobilePhoneAccessories%2Fchargers.jpg?alt=media',
      'earphones & headsets#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FmobilePhoneAccessories%2FearphonesHeadsets.png?alt=media',
      'microSD cards#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FmobilePhoneAccessories%2FmicroSDCards.jpg?alt=media',
      'screen protectors#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FmobilePhoneAccessories%2FscreenProtectors.jpg?alt=media',
      'selfie sticks & tripods#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FmobilePhoneAccessories%2FselfieStickTripod.jpg?alt=media',
      'smart watches#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FmobilePhoneAccessories%2FsmartWatches.png?alt=media',
    ],
  },
  'computing': {
    'computers': [
      'desktops#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2Fcomputers%2Fdesktops.png?alt=media',
      'laptops#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2Fcomputers%2Flaptop.jpeg?alt=media',
      'monitors#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2Fcomputers%2Fmonitors.jpg?alt=media',
    ],
    'data storage': [
      'external hard drives#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FdataStorage%2FexternalHDD.jpg?alt=media',
      'USB flash drives#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FdataStorage%2FusbFlash.jpg?alt=media',
      'external solid state drives#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FdataStorage%2FexternalSSD.png?alt=media',
    ],
    'antivirus & security': [
      'antivirus#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FantivirusAndSecurity%2Fantivirus.jpg?alt=media',
      'internet security#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FantivirusAndSecurity%2FinternetSecurity.jpg?alt=media',
    ],
    'printers': [
      'inkjet printers#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2Fprinters%2FinkjetPrinter.jpg?alt=media',
      'laser printers#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2Fprinters%2FlaserPrinter.png?alt=media',
      'printer ink & toner#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2Fprinters%2FprinterInkToner.jpg?alt=media',
    ],
    'computer accessories': [
      'keyboards, mice & accessories#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FcomputerAccessories%2FkeyboardMice.jpg?alt=media',
      'uninterrupted power supply (UPS)#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FcomputerAccessories%2FUPS.jpg?alt=media',
      'memory cards#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FcomputerAccessories%2FmemoryCards.jpg?alt=media',
      'batteries#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FcomputerAccessories%2Fbattery.jpg?alt=media',
      'scanners#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FcomputerAccessories%2Fscanner.jpg?alt=media',
      'video projectors#https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fcategory_icons%2FcomputerAccessories%2Fprojectors.jpg?alt=media',
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
