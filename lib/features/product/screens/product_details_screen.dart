import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/common/widgets/custom_network_image.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/features/user/widgets/info_tab.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/product-details';
  final String productName;
  const ProductDetailsScreen({
    super.key,
    required this.productName,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String _state = '';
  String _country = 'Nigeria';

  String _city = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(title: 'Details', context: context),
      backgroundColor: backgroundGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 300,
              margin: const EdgeInsets.all(10),
              child: const CustomNetworkImage(
                imageSource:
                    'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/46/502258/1.jpg?4825',
                width: 350,
                height: 350,
              ),
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  officialStoreBadge(),
                  const SizedBox(height: 10),
                  Text(
                    'This is the product name'.toUpperCase(),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'Brand: ',
                        style: TextStyle(fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Brand Name',
                          style: TextStyle(color: shadeOfOrange, fontSize: 12),
                        ),
                      ),
                      const Text(' | '),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Similar products from brand',
                          style: TextStyle(color: shadeOfBlue, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  freeDeliveryBadge(),
                  const SizedBox(height: 10),
                  const Text(
                    '₦ 3000',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  unitsLeft(2),
                  const SizedBox(height: 20),
                  shippingCost(150),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'See options',
                      style: TextStyle(color: shadeOfBlue),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RatingBarIndicator(
                    rating: 4.4,
                    itemSize: 16,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '52 ratings',
                        style: TextStyle(color: shadeOfBlue),
                      ),
                      const Expanded(
                        child: SizedBox(
                          height: 10,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.share,
                          color: shadeOfOrange,
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      RatingBar(
                        itemCount: 1,
                        maxRating: 1,
                        minRating: 0,
                        allowHalfRating: false,
                        initialRating: 0,
                        itemSize: 20,
                        ratingWidget: RatingWidget(
                          empty: Image.asset(
                              'assets/rating_images/heart_border.png'),
                          full: Image.asset('assets/rating_images/heart.png'),
                          half: Image.asset(
                              'assets/rating_images/heart_half.png'),
                        ),
                        onRatingUpdate: (value) {},
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
            const InfoTab(description: 'PROMOTIONS'),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        foregroundImage: AssetImage('assets/images/jumier.png'),
                        backgroundColor: Colors.white,
                        radius: 25,
                      ),
                      Flexible(
                        child: Text(
                          'Enjoy cheaper shipping fees when you select a PickUp Station at checkout.',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white),
                        child: Image.asset(
                          'assets/images/shield.png',
                          cacheWidth: 125,
                          cacheHeight: 125,
                        ),
                      ),
                      const Flexible(
                        child: Text(
                          'Borrow loans up to 200,000 to make life easier. No collateral, no paperwork via Jumia  pay financial partners',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const InfoTab(description: 'DELIVERY AND RETURNS'),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/express.png',
                    height: 15,
                    alignment: Alignment.centerLeft,
                  ),
                  RichText(
                    text: TextSpan(
                      text:
                          'Free delivery on thousands of products in Lagos, Ibadan & Abuja ',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: 'Details',
                          style: TextStyle(
                            color: shadeOfBlue,
                            fontSize: 14,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 0,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Choose Location',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // DropdownButtonFormField(
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //           borderSide: const BorderSide(
                  //               color: Colors.grey, width: 2))),
                  //   value: _locationFrom,
                  //   isExpanded: true,
                  //   items: const [
                  //     DropdownMenuItem(
                  //       value: 'Lagos',
                  //       child: Text('Lagos'),
                  //     ),
                  //     DropdownMenuItem(
                  //       value: 'Abuja',
                  //       child: Text('Abuja'),
                  //     ),
                  //     DropdownMenuItem(
                  //       value: 'Ibadan',
                  //       child: Text('Ibadan'),
                  //     ),
                  //   ],
                  //   onChanged: (value) => selectLocationFrom(value),
                  // )
                  CSCPicker(
                    defaultCountry: DefaultCountry.Nigeria,
                    disableCountry: true,
                    showCities: true,
                    showStates: true,
                    stateSearchPlaceholder: "State",
                    citySearchPlaceholder: "City",
                    stateDropdownLabel: "*State",
                    cityDropdownLabel: "*City",
                    onCityChanged: (value) => selectCity(value),
                    onStateChanged: (value) => selectState(value),
                    onCountryChanged: (value) => selectCountry(value),
                    currentCountry: _country,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void selectCountry(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _country = selectedValue;
      });
    }
  }

  void selectState(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _state = selectedValue;
      });
    }
  }

  void selectCity(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _city = selectedValue;
      });
    }
  }
}
