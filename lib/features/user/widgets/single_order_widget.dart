import 'package:flutter/material.dart';
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/common/widgets/custom_network_image.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/features/user/screens/order_screens/order_details_screen.dart';

class SingleOrderWidget extends StatelessWidget {
  const SingleOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // TODO: parse order object into arguments
      onTap: () => Navigator.pushNamed(
        context,
        OrderDetailsScreen.routeName,
        arguments: null,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        height: 150,
        color: Colors.white,
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
                  const SizedBox(height: 10),
                  const Text("Order #0123456789"),
                  const Expanded(child: SizedBox()),
                  orderStatusBadge(stage: 5),
                  Text(
                    'on ${DateTime.now().toString().split(' ')[0]}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
