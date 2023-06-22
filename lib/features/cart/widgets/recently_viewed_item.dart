import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/custom_button.dart';
import 'package:jumier/common/widgets/custom_network_image.dart';
import 'package:jumier/global_variables.dart';

class RecentlyViewedItem extends StatefulWidget {
  const RecentlyViewedItem({
    super.key,
  });

  @override
  State<RecentlyViewedItem> createState() => _RecentlyViewedItemState();
}

class _RecentlyViewedItemState extends State<RecentlyViewedItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 10,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomNetworkImage(
                  imageSource:
                      'https://ng.jumia.is/cms/0-1-homepage/0-0-thumbnails/v2/fashion_220x220.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'This is the name of the product',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '₦ 1,000',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            height: 15,
            thickness: 1.5,
            color: backgroundGrey,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              // TODO: wrap the icons with gesture detectors and bind their onTap callback to increasing and reducing the quantity of the selected item in the cart.

              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black26, width: 1.5),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        selectVariation();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Variation',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                            size: 26,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                CustomButton(
                  text: 'BUY NOW',
                  width: 140,
                  height: 45,
                  textStyle: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void selectVariation() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Select Options',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    for (int i = 0; i < 4; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Variant name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: '₦ 1,000',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '  ₦ 2,000',
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 12,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'few units left',
                                  style: TextStyle(
                                    color: Color.fromARGB(204, 233, 185, 30),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            CustomButton(
                              text: 'ADD TO CART',
                              textStyle: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              onTap: () {},
                              height: 40,
                              width: 140,
                              showShadows: false,
                            ),
                          ],
                        ),
                      ),
                    const Text(
                      'Currently unavailable: Variant ABC',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: backgroundGrey,
                      thickness: 2,
                    ),
                    CustomButton(
                      text: 'PROCEED WITH ORDER',
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: 'CONTINUE SHOPPING',
                      onTap: () {},
                      showBorder: true,
                      showShadows: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
