import "package:flutter/material.dart";
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/common/widgets/custom_button.dart';
import 'package:jumier/common/widgets/custom_network_image.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/features/user/screens/order_screens/order_tracking_screen.dart';
import 'package:jumier/features/user/widgets/info_tab.dart';
import 'package:jumier/models/order.dart';

class OrderDetailsScreen extends StatelessWidget {
  static const routeName = './account/orders/order-details';
  final Order? order;
  const OrderDetailsScreen({super.key, this.order});

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
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                ],
              ),
            ),
            const InfoTab(description: 'items in your order'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: orderStatusBadge(stage: 0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5),
                    child: Text(
                      'On ${DateTime.now().toString().split(' ')[0]}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    color: backgroundGrey,
                    thickness: 2.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: 120,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomNetworkImage(
                              imageSource:
                                  "https://ng.jumia.is/cms/0-1-christmas-sale/2022/thumbnails/portable-power_220x220.png",
                              height: 120,
                              width: 120),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: screenWidth(context) - 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "This is the name of the first item in the order",
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Expanded(child: SizedBox()),
                                RichText(
                                  text: const TextSpan(
                                    text: 'QTY: ',
                                    style: TextStyle(color: Colors.grey),
                                    children: [
                                      TextSpan(
                                        text: '1',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: '₦ 2,000 ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: '₦ 3,000',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: backgroundGrey,
                    thickness: 1.5,
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomButton(
                      text: 'buy again',
                      height: 40,
                      onTap: () {},
                    ),
                  ),
                  Divider(
                    color: backgroundGrey,
                    thickness: 1.5,
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomButton(
                      text: 'track my item',
                      height: 40,
                      onTap: () {
                        //TODO: parse the correct order status number here after updating the router method
                        Navigator.pushNamed(
                          context,
                          OrderTrackingScreen.routeName,
                        );
                      },
                    ),
                  ),
                  Divider(
                    color: backgroundGrey,
                    thickness: 1.5,
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomButton(
                      text: 'see status history',
                      height: 36,
                      onTap: () {},
                      showBorder: true,
                      showShadows: false,
                    ),
                  ),
                ],
              ),
            ),
            const InfoTab(description: 'payment'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                    child: Text(
                      'Payment Method',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                    child: Text(
                      'Cash on Delivery',
                    ),
                  ),
                  Divider(
                    color: backgroundGrey,
                    thickness: 1.0,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    child: Text(
                      'Payment Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 2),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Items Total:  ',
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: '₦ 2,000',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 2),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Shipping Fees:  ',
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: '₦ 500',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 2),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Promotion Discount:  ',
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: '- ₦ 500',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 2),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Total:  ',
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: '₦ 2,000',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const InfoTab(description: 'delivery'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                    child: Text(
                      'Delivery Option',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                    child: Text(
                      'Door Delivery',
                    ),
                  ),
                  Divider(
                    color: backgroundGrey,
                    thickness: 1.0,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    child: Text(
                      'Shipping Address',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
                    child: Text(
                      '100A Fake Address Street',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
                    child: Text(
                      'Fake-State, FAKE-TOWN',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
