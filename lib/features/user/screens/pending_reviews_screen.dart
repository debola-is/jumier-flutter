import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/features/user/widgets/single_reviewable_item.dart';

class PendingReviewsScreen extends StatelessWidget {
  static const routeName = './account/reviews/pending-reviews';

  const PendingReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        title: 'Pending Reviews',
        context: context,
        showCart: true,
        showSearch: true,
      ),
      backgroundColor: backgroundGrey,
      body: ListView.separated(
        itemBuilder: (context, index) => const SingleReviewableItem(),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10.0,
        ),
        itemCount: 3,
      ),
    );
  }
}
