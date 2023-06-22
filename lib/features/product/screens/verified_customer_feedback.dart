import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/common/widgets/custom_scroll_behaviour.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/features/product/widgets/rating_stars_counter.dart';
import 'package:jumier/features/product/widgets/review_comment.dart';

class VerifiedCustomerFeedbackScreen extends StatelessWidget {
  static const routeName = './verified-customer-feedback-screen';
  const VerifiedCustomerFeedbackScreen({super.key});

  // TODO: Implement pagination such that only first three reviews are fetched at first.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        title: 'Verified Customer Feedback',
        context: context,
        showCart: true,
        showHomeNavigator: true,
        showSearch: true,
      ),
      backgroundColor: shadeOfGrey,
      body: ScrollConfiguration(
        behavior: CustomScrollBehaviour(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: shadeOfGrey,
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                width: double.infinity,
                child: Text(
                  'verified product ratings (3)'.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: shadeOfGrey,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            '4.4/5',
                            style: TextStyle(
                              color: shadeOfOrange,
                              fontSize: 26.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          RatingBarIndicator(
                            // TODO: Change actual rating value to average rating of product
                            rating: 4.4,
                            itemSize: 16.0,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            '3 ratings',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.fromLTRB(
                            20,
                            20,
                            40,
                            20,
                          ),
                          child: Column(
                            children: const [
                              // TODO: Replace count with the number of occurence of each rating number in the ratings of the product, and also the total ratings count.
                              RatingStarCounter(
                                  count: 3,
                                  starNumber: 5,
                                  totalRatingsCount: 5),
                              RatingStarCounter(
                                  count: 1,
                                  starNumber: 4,
                                  totalRatingsCount: 5),
                              RatingStarCounter(
                                  count: 1,
                                  starNumber: 3,
                                  totalRatingsCount: 5),
                              RatingStarCounter(
                                  count: 0,
                                  starNumber: 2,
                                  totalRatingsCount: 5),
                              RatingStarCounter(
                                  count: 0,
                                  starNumber: 1,
                                  totalRatingsCount: 5),
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Container(
                color: shadeOfGrey,
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                width: double.infinity,
                child: Text(
                  'comments from verified purchases (3)'.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Column(
                children: [for (int i = 0; i < 5; i++) const ReviewComment()],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
