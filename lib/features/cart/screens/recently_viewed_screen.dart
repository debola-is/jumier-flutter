import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/features/cart/widgets/cart_item.dart';
import 'package:jumier/features/cart/widgets/recently_viewed_item.dart';

class RecentlyViewedScreen extends StatelessWidget {
  static const routeName = './cart/recently-viewed';
  const RecentlyViewedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        title: 'Recently Viewed',
        context: context,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return const RecentlyViewedItem();
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: 15),
      backgroundColor: backgroundGrey,
    );
  }
}
