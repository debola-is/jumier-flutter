import 'package:carousel_slider/carousel_slider.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/common/widgets/custom_button.dart';
import 'package:jumier/common/widgets/custom_network_image.dart';
import 'package:jumier/common/widgets/custom_scroll_behaviour.dart';
import 'package:jumier/features/cart/widgets/recently_viewed.dart';
import 'package:jumier/features/cart/widgets/recommended_for_you.dart';
import 'package:jumier/features/home/screens/home_screen.dart';
import 'package:jumier/features/product/screens/product_description_screen.dart';
import 'package:jumier/features/product/screens/verified_customer_feedback.dart';
import 'package:jumier/features/user/widgets/info_tab.dart';
import 'package:jumier/general_home.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/models/product.dart';
import 'package:jumier/services/product_services.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/product-details';
  final Product product;
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isInCart = false;

  List<Widget> getImages() {
    List<Widget> compileVariantsImages() {
      List<Widget> images = [];
      for (int i = 0; i < widget.product.variants!.length; i++) {
        var variant = widget.product.variants![i];
        images.add(
          CustomNetworkImage(
              imageSource: variant.image, height: 200, width: 200),
        );
      }
      return images;
    }

    return widget.product.variants!.isEmpty
        ? widget.product.images
            .map(
              (e) => CustomNetworkImage(
                imageSource: e,
                height: 200,
                width: 200,
              ),
            )
            .toList()
        : compileVariantsImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        title: 'Details',
        context: context,
        showCart: true,
        showHomeNavigator: true,
        showSearch: true,
      ),
      backgroundColor: backgroundGrey,
      body: ScrollConfiguration(
        behavior: CustomScrollBehaviour(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                height: 300,
                margin: const EdgeInsets.all(10),
                child: CarouselSlider(
                  items: getImages(),
                  options: CarouselOptions(enableInfiniteScroll: false),
                ),
              ),
              Container(
                color: Colors.white,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // officialStoreBadge(),
                    // const SizedBox(height: 10),
                    Text(
                      widget.product.name.toUpperCase(),
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
                            widget.product.brand.toCapitalized(),
                            style:
                                TextStyle(color: shadeOfOrange, fontSize: 12),
                          ),
                        ),
                        const Text(' | '),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Similar products from ${widget.product.brand.toCapitalized()}',
                            style: TextStyle(color: shadeOfBlue, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (widget.product.isExpressAvailable) freeDeliveryBadge(),
                    const SizedBox(height: 10),
                    Text(
                      '₦ ${widget.product.price?.round()}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    if (widget.product.quantity! < 11)
                      unitsLeft(widget.product.quantity!),
                    const SizedBox(height: 20),
                    shippingCost(150),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'See options',
                        style: TextStyle(color: shadeOfBlue),
                      ),
                    ),
                    const SizedBox(height: 5),
                    InkWell(
                      onTap: () => Navigator.pushNamed(
                        context,
                        VerifiedCustomerFeedbackScreen.routeName,
                      ),
                      child: Row(
                        children: [
                          // Get Ratings for app
                          RatingBarIndicator(
                            rating: ProductServices.calculateRatingsScore(
                                widget.product),
                            itemSize: 16,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.product.ratings!.isEmpty
                                ? "No ratings yet"
                                : "${widget.product.ratings!.length} rrating(s)",
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
                              size: 24,
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
                              full:
                                  Image.asset('assets/rating_images/heart.png'),
                              half: Image.asset(
                                  'assets/rating_images/heart_half.png'),
                            ),
                            onRatingUpdate: (value) {},
                          )
                        ],
                      ),
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
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white),
                          child: Image.asset(
                            'assets/images/jumier.png',
                            cacheWidth: 125,
                            cacheHeight: 125,
                          ),
                        ),
                        const Flexible(
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
              // Container(
              //   color: Colors.white,
              //   padding: const EdgeInsets.all(10),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const Text(
              //         'Choose Location',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //       const SizedBox(
              //         height: 15,
              //       ),
              //       CSCPicker(
              //         defaultCountry: DefaultCountry.Nigeria,
              //         disableCountry: true,
              //         showCities: true,
              //         showStates: true,
              //         stateSearchPlaceholder: "State",
              //         citySearchPlaceholder: "City",
              //         stateDropdownLabel: "*State",
              //         cityDropdownLabel: "*City",
              //         onCityChanged: (value) => selectCity(value),
              //         onStateChanged: (value) => selectState(value),
              //         onCountryChanged: (value) => selectCountry(value),
              //         currentCountry: _country,
              //       ),
              //     ],
              //   ),
              // ),
              const InfoTab(description: 'PRODUCT DETAILS'),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                color: Colors.white,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ProductDescriptionScreen(
                                  description: widget.product.description,
                                  keyFeatures: 'keyFeatures',
                                  specifications: 'specifications'),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Description',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                              size: 24,
                            )
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      height: 10,
                      thickness: 2,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Text(
                        widget.product.description,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
              const InfoTab(description: 'CUSTOMERS ALSO VIEWED'),
              const Recommendatios(showDescription: false),
              const InfoTab(description: 'RECENTLY VIEWED'),
              const RecentlyViewed(showDescription: false),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: backgroundGrey, width: 2.0))),
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CustomButton(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  GeneralHome.routeName,
                  arguments: 0,
                );
              },
              height: 40,
              width: 40,
              content: Icon(
                Icons.home_outlined,
                color: shadeOfOrange,
                size: 20,
              ),
              showBorder: true,
              showShadows: false,
            ),
            const SizedBox(width: 10),
            CustomButton(
              onTap: () {},
              height: 40,
              width: 40,
              content: Icon(
                Icons.phone,
                color: shadeOfOrange,
                size: 20,
              ),
              showBorder: true,
              showShadows: false,
            ),
            const SizedBox(width: 10),
            if (!isInCart)
              CustomButton(
                onTap: () {
                  isInCart = true;
                  if (mounted) {
                    setState(() {});
                  }
                },
                height: 50,
                width: screenWidth(context) - 130,
                showShadows: false,
                content: SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: const [
                      Positioned(
                        left: 10,
                        top: 10,
                        child: Icon(
                          Icons.add_shopping_cart_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Center(
                        child: Text(
                          'ADD TO CART',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (isInCart)
              CustomButton(
                onTap: () {
                  isInCart = false;
                  if (mounted) {
                    setState(() {});
                  }
                },
                height: 50,
                width: 50,
                content: const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 30,
                ),
                showShadows: false,
              ),
            if (isInCart)
              const Expanded(
                child: Text(
                  '1',
                  textAlign: TextAlign.center,
                ),
              ),
            if (isInCart)
              CustomButton(
                onTap: () {},
                height: 50,
                width: 50,
                content: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
                showShadows: false,
              ),
          ],
        ),
      ),
    );
  }

  // void selectCountry(String? selectedValue) {
  //   if (selectedValue is String) {
  //     setState(() {
  //       _country = selectedValue;
  //     });
  //   }
  // }

  // void selectState(String? selectedValue) {
  //   if (selectedValue is String) {
  //     setState(() {
  //       _state = selectedValue;
  //     });
  //   }
  // }

  // void selectCity(String? selectedValue) {
  //   if (selectedValue is String) {
  //     setState(() {
  //       _city = selectedValue;
  //     });
  //   }
  // }
}
