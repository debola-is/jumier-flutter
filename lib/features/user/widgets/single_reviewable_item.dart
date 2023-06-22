import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/custom_button.dart';
import 'package:jumier/common/widgets/custom_network_image.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/features/user/screens/rate_product_screen.dart';

class SingleReviewableItem extends StatelessWidget {
  const SingleReviewableItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      height: 190.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 100.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomNetworkImage(
                    imageSource:
                        "https://ng.jumia.is/cms/0-1-christmas-sale/2022/thumbnails/portable-power_220x220.png",
                    height: 100.0,
                    width: 100.0),
                const SizedBox(
                  width: 5.0,
                ),
                SizedBox(
                  width: screenWidth(context) - 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "This is the name of the first item in the order",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const Expanded(child: SizedBox()),
                      const Text(
                        "Order No: 0123456789",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Delivered on ${DateTime.now().toString().split(' ')[0]}'
                            .toUpperCase(),
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: backgroundGrey,
            thickness: 1.5,
            height: 20.0,
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(top: 5.0, right: 5.0, bottom: 5.0),
            child: CustomButton(
              text: 'rate & review',
              width: 120,
              height: 40,
              onTap: () {
                Navigator.pushNamed(context, RateProductScreen.routeName);
              },
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              showShadows: false,
            ),
          )
        ],
      ),
    );
  }
}
