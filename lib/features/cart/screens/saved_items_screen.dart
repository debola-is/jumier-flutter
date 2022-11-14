import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/features/cart/widgets/cart_item.dart';

class SavedItemsScreen extends StatelessWidget {
  static const routeName = './cart/saved-items';
  const SavedItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(title: 'Saved Items', context: context),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return const SingleCartItem(
              inStock: true,
              inCart: false,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: 15),
      backgroundColor: backgroundGrey,
    );
  }
}
