import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/constants.dart';

class ProductReviewsScreen extends StatelessWidget {
  static const routeName = './product/verified-reviews';
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        title: 'Verified customer feedback',
        context: context,
        showCart: true,
        showSearch: true,
      ),
      backgroundColor: backgroundGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
