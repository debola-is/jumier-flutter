import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jumier/constants.dart';

class ReviewComment extends StatelessWidget {
  //TODO: Uncomment these fields and supply appropriate inputs in the product_reviews_screen
  // final String reviewTitle;
  // final String reviewContent;
  // final String reviewerName;
  // final String reviewDate;
  const ReviewComment({
    super.key,
    //  required this.reviewTitle, required this.reviewContent, required this.reviewerName, required this.reviewDate,
  });

  String formatDate(int date) {
    if (date < 10) {
      return '0$date';
    } else {
      return '$date';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingBarIndicator(
                // TODO: Change actual rating value to rating supplied by the reviewer
                rating: 4.5,
                itemSize: 18.0,
                unratedColor: Colors.grey.shade300,
                itemBuilder: (context, index) => Icon(
                  Icons.star_rate_rounded,
                  color: shadeOfOrange,
                ),
              ),
              Text(
                '${formatDate(DateTime.now().day)}-${formatDate(DateTime.now().month)}-${DateTime.now().year}',
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Rewiew Title',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Review content: wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'by ReviewerName',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                child: Row(
                  children: const [
                    Icon(
                      Icons.verified_outlined,
                      color: Colors.green,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Verified Purchase',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
