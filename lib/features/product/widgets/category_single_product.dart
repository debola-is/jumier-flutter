import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/common/widgets/custom_button.dart';
import 'package:jumier/common/widgets/custom_network_image.dart';
import 'package:jumier/features/product/screens/product_details_screen.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/models/product.dart';
import 'package:jumier/services/product_services.dart';

class CategorySingleProduct extends StatelessWidget {
  final Layout layout;
  final Product productData;
  const CategorySingleProduct({
    super.key,
    required this.layout,
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pushNamed(
            context, ProductDetailsScreen.routeName,
            arguments: productData),
        child: layout == Layout.list
            ? Container(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 10),
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
                            CustomNetworkImage(
                              imageSource: productData.variants!.isEmpty
                                  ? productData.images[0]
                                  : productData.variants![0].image,
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
                                  full: Image.asset(
                                      'assets/rating_images/heart.png'),
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
                              if (productData.isExpressAvailable)
                                freeDeliveryBadge(),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                productData.name,
                                maxLines: 1,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '₦ ${productData.price?.floor()}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    unratedColor: Colors.black26,
                                    rating:
                                        ProductServices.calculateRatingsScore(
                                            productData),
                                    itemSize: 18,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star_rounded,
                                      color: shadeOfOrange,
                                    ),
                                  ),
                                  Text(
                                    '(${productData.ratings!.length})',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              if (productData.isExpressAvailable)
                                Row(
                                  children: [
                                    const Text(
                                      'Express shipping',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black38,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Icon(
                                      Icons.airplanemode_active,
                                      size: 16,
                                      color: shadeOfOrange,
                                    ),
                                  ],
                                ),
                              if (productData.isExpressAvailable)
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(),
                        CustomButton(
                          onTap: () {},
                          text: "Add to cart",
                          width: 150,
                          color: Colors.orange.shade400,
                          height: 35,
                        )
                      ],
                    )
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
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: CustomNetworkImage(
                                imageSource: productData.variants!.isEmpty
                                    ? productData.images[0]
                                    : productData.variants![0].image,
                                width: 120,
                                height: 120,
                              ),
                            ),
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
                              full:
                                  Image.asset('assets/rating_images/heart.png'),
                              half: Image.asset(
                                  'assets/rating_images/heart_half.png'),
                            ),
                            onRatingUpdate: (value) {},
                          ),
                        ),
                        if (productData.isExpressAvailable)
                          Positioned(
                            top: 5,
                            child: freeDeliveryBadge(),
                          ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productData.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          Text(
                            '₦ ${productData.price?.floor()}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          // if (productData.ratings!.isNotEmpty)
                          Row(
                            children: [
                              RatingBarIndicator(
                                unratedColor: Colors.black26,
                                rating: ProductServices.calculateRatingsScore(
                                    productData),
                                itemSize: 18,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star_rounded,
                                  color: shadeOfOrange,
                                ),
                              ),
                              Text(
                                '(${productData.ratings!.length})',
                                style: const TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          if (productData.isExpressAvailable)
                            Row(
                              children: [
                                Text(
                                  'EXPRESS ',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.orange.shade800,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Icon(
                                  Icons.airplanemode_active,
                                  size: 16,
                                  color: Colors.orange.shade800,
                                ),
                              ],
                            ),

                          const Expanded(
                            child: SizedBox(height: 10),
                          ),
                          CustomButton(
                            onTap: () {},
                            text: "Add to cart",
                            height: 35,
                            color: Colors.orange.shade400,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ));
  }
}
