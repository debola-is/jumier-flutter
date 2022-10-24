import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/constants.dart';

class CartSingleProduct extends StatelessWidget {
  const CartSingleProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
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
                  Image.network(
                    'https://ng.jumia.is/cms/0-1-homepage/0-0-thumbnails/v2/fashion_220x220.png',
                    width: 100,
                    height: 150,
                    fit: BoxFit.contain,
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
                        full: Image.asset('assets/rating_images/heart.png'),
                        half:
                            Image.asset('assets/rating_images/heart_half.png'),
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
                      '\$ 1,000',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RatingBarIndicator(
                      unratedColor: Colors.black26,
                      rating: 5,
                      itemSize: 12,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Express shipping',
                          style: TextStyle(fontSize: 12, letterSpacing: 0.8),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.airplanemode_active,
                          size: 16,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
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
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 80,
                alignment: Alignment.center,
                child: const Text('5'),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
