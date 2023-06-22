import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/common/widgets/custom_network_image.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/features/product/screens/see_all_products_screen.dart';

class CategorySingleProduct extends StatelessWidget {
  final Layout layout;
  const CategorySingleProduct({
    super.key,
    required this.layout,
  });

  @override
  Widget build(BuildContext context) {
    return layout == Layout.list
        ? Container(
            padding:
                const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        const CustomNetworkImage(
                          imageSource:
                              'https://ng.jumia.is/cms/0-1-homepage/0-0-thumbnails/v2/fashion_220x220.png',
                          width: 120,
                          height: 120,
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: RatingBar(
                            initialRating: 0,
                            allowHalfRating: false,
                            itemCount: 1,
                            itemSize: 14,
                            glowColor: Colors.amber,
                            ratingWidget: RatingWidget(
                              empty: Image.asset(
                                  'assets/rating_images/heart_border.png'),
                              full:
                                  Image.asset('assets/rating_images/heart.png'),
                              half: Image.asset(
                                  'assets/rating_images/heart_half.png'),
                            ),
                            onRatingUpdate: (value) {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              freeDeliveryBadge(),
                              SizedBox(
                                width: screenWidth(context) / 8,
                              ),
                              officialStoreBadge(),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'This is the name of the product',
                            maxLines: 2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '₦1,000',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RatingBarIndicator(
                            unratedColor: Colors.black26,
                            rating: 5,
                            itemSize: 12,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: shadeOfOrange,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Express shipping',
                                style:
                                    TextStyle(fontSize: 12, letterSpacing: 0.8),
                              ),
                              const SizedBox(width: 5),
                              Icon(
                                Icons.airplanemode_active,
                                size: 16,
                                color: shadeOfOrange,
                              ),
                            ],
                          ),
                          RichText(
                            text: const TextSpan(
                                text: 'Eligible for ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                      text: 'Free Delivery',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.black,
                                      ))
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: CustomNetworkImage(
                        imageSource:
                            'https://ng.jumia.is/cms/0-1-homepage/0-0-thumbnails/v2/fashion_220x220.png',
                        width: 120,
                        height: 120,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: RatingBar(
                        initialRating: 0,
                        allowHalfRating: false,
                        itemCount: 1,
                        itemSize: 14,
                        glowColor: Colors.amber,
                        ratingWidget: RatingWidget(
                          empty: Image.asset(
                              'assets/rating_images/heart_border.png'),
                          full: Image.asset('assets/rating_images/heart.png'),
                          half: Image.asset(
                              'assets/rating_images/heart_half.png'),
                        ),
                        onRatingUpdate: (value) {},
                      ),
                    ),
                    Positioned(
                      top: 5,
                      child: freeDeliveryBadge(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          officialStoreBadge(),
                          SizedBox(
                            width: screenWidth(context) / 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'This is the name of the product',
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '₦1,000',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RatingBarIndicator(
                        unratedColor: Colors.black26,
                        rating: 5,
                        itemSize: 12,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: shadeOfOrange,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Express shipping',
                            style: TextStyle(fontSize: 12, letterSpacing: 0.8),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.airplanemode_active,
                            size: 16,
                            color: shadeOfOrange,
                          ),
                        ],
                      ),
                      RichText(
                        text: const TextSpan(
                            text: 'Eligible for ',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                  text: 'Free Delivery',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.black,
                                  ))
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
