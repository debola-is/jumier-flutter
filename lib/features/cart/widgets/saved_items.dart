import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/custom_scroll_behaviour.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/features/cart/screens/saved_items_screen.dart';
import 'package:jumier/features/home/widgets/home_display_product.dart';

class SavedItems extends StatelessWidget {
  const SavedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SAVED ITEMS (10)',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, SavedItemsScreen.routeName),
                child: Text(
                  'SEE ALL',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: shadeOfOrange,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 260,
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: Colors.white,
          child: ScrollConfiguration(
            behavior: CustomScrollBehaviour(),
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const HomeDisplayProduct(
                imageSource:
                    'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/53/673318/1.jpg?4650',
                displayAddToCartButton: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
