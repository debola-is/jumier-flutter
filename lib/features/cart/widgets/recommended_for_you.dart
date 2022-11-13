import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/custom_scroll_behaviour.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/features/cart/screens/recently_viewed_screen.dart';
import 'package:jumier/features/home/widgets/home_display_product.dart';

class Recommendatios extends StatelessWidget {
  const Recommendatios({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          width: double.infinity,
          alignment: Alignment.centerLeft,
          color: Colors.white,
          child: Text(
            'RECOMMENDED FOR YOU',
            style: TextStyle(
              fontSize: 13,
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
        Container(
          height: 240,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.white,
          child: ScrollConfiguration(
            behavior: CustomScrollBehaviour(),
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const HomeDisplayProduct(
                imageSource:
                    'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/53/673318/1.jpg?4650',
                displayPreviousPrice: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
