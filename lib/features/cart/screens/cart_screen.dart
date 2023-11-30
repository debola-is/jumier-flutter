import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/common/widgets/custom_button.dart';
import 'package:jumier/common/widgets/custom_scroll_behaviour.dart';
import 'package:jumier/features/cart/widgets/cart_item.dart';
import 'package:jumier/features/cart/widgets/recently_viewed.dart';
import 'package:jumier/features/cart/widgets/recommended_for_you.dart';
import 'package:jumier/features/cart/widgets/saved_items.dart';
import 'package:jumier/features/user/widgets/info_tab.dart';
import 'package:jumier/global_variables.dart';

class CartScreen extends StatefulWidget {
  static const routeName = './cart-screen';
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          getAppbar(title: 'Cart', context: context, showHomeNavigator: true),
      backgroundColor: backgroundGrey,
      body: ScrollConfiguration(
        behavior: CustomScrollBehaviour(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const InfoTab(
                description: 'CART SUMMARY',
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                  left: 15,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Cart(7)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '₦ 138,039',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: backgroundGrey,
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Subtotal',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '₦ 138,039',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Delivery fees not included yet',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const InfoTab(
                description: 'CART (7)',
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                  left: 15,
                ),
              ),
              const SingleCartItem(
                inStock: true,
                inCart: true,
              ),
              const InfoTab(
                description: 'not included (3)',
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 15,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: const Text(
                  'These items were not included in your cart because they are out of stock',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 5),
              const SingleCartItem(inStock: false),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Returns are easy',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Free returns within 15 days for Official Store items and 7 days for other eligible items.',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const SavedItems(),
              const SizedBox(height: 20),
              const RecentlyViewed(),
              const SizedBox(height: 20),
              const Recommendatios(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: CustomButton(text: 'CHECKOUT (₦ 138,039)', onTap: () {}),
        ),
      ),
    );
  }
}
