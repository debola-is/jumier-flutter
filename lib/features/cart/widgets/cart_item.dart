import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/custom_button.dart';
import 'package:jumier/common/widgets/custom_network_image.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/features/cart/widgets/add_button.dart';
import 'package:jumier/features/cart/widgets/out_of_stock.dart';

class SingleCartItem extends StatefulWidget {
  final bool inStock;
  final bool inCart;
  const SingleCartItem({
    super.key,
    required this.inStock,
    this.inCart = false,
  });

  @override
  State<SingleCartItem> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 10, left: 10, right: 10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Opacity(
            opacity: widget.inStock == true ? 1 : 0.5,
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
                    children: [
                      const Text(
                        'This is the name of the product',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: 'Seller: ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black38,
                          ),
                          children: [
                            TextSpan(
                              text: 'This is the seller name',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: 'Variation: ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black38,
                          ),
                          children: [
                            TextSpan(
                              text: 'Variant 1',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '₦ 1,000',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'In Stock',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black38,
                        ),
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
          Row(
            // TODO: wrap the icons with gesture detectors and bind their onTap callback to increasing and reducing the quantity of the selected item in the cart.

            children: [
              Icon(
                Icons.delete_outline,
                color: shadeOfOrange,
                size: 24,
              ),
              const SizedBox(width: 10),
              Text(
                'REMOVE',
                style: TextStyle(
                  color: shadeOfOrange,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Expanded(
                child: SizedBox(
                  height: 10,
                ),
              ),
              if (widget.inStock && widget.inCart)
                Row(
                  children: [
                    CartItemButton(
                      onTap: () {},
                      icon: Icons.remove,
                      enabled: false,
                    ),
                    const SizedBox(
                      width: 70,
                      // TODO: The text to be displayed here should be the quantity of the item in the cart. Should update in real time.

                      child: Text(
                        '1',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    CartItemButton(
                      onTap: () {},
                      icon: Icons.add,
                      enabled: true,
                    ),
                  ],
                ),
              if (!widget.inStock) const OutOfStockBanner(),
              if (widget.inStock && !widget.inCart)
                CustomButton(
                  text: 'ADD TO CART',
                  onTap: () {},
                  width: 140,
                  height: 40,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
