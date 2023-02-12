import "package:flutter/material.dart";
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/models/order.dart';

class OrderDetailsScreen extends StatelessWidget {
  static const routeName = './account/orders/order-details';
  final Order order;
  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        title: 'Order Details',
        context: context,
        showCart: true,
        showSearch: true,
      ),
      backgroundColor: backgroundGrey,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            color: Colors.white,
            child: Column(children: [
              const Text(
                'Order #1234567890',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Placed on ${DateTime.now().toString().split(' ')[0]}',
                style: const TextStyle(color: Colors.grey),
              ),
              const Text(
                'No of items:  1',
                style: TextStyle(color: Colors.grey),
              ),
              const Text(
                'Total: ₦ 2,000',
                style: TextStyle(color: Colors.grey),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
