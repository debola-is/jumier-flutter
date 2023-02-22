import 'package:flutter/material.dart';
import 'package:jumier/constants.dart';

class RatingStarCounter extends StatelessWidget {
  final int starNumber;
  final int count;
  final int totalRatingsCount;
  const RatingStarCounter({
    super.key,
    required this.count,
    required this.starNumber,
    required this.totalRatingsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$starNumber',
          style: const TextStyle(fontSize: 12),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Icon(
            Icons.star_rounded,
            color: shadeOfOrange,
          ),
        ),
        Text(
          '($count)',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const Expanded(
          child: SizedBox(
            height: 1,
          ),
        ),
        SizedBox(
          width: screenWidth(context) / 4,
          height: 5,
          child: LinearProgressIndicator(
            color: shadeOfOrange,
            backgroundColor: shadeOfGrey,
            value: (count / totalRatingsCount),
          ),
        ),
      ],
    );
  }
}
