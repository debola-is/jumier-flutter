import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/custom_network_image.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/models/product.dart';

class AdminSingleProduct extends StatelessWidget {
  final Product product;
  final VoidCallback deleteProductCallback;
  const AdminSingleProduct({
    super.key,
    required this.product,
    required this.deleteProductCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: screenWidth(context) / 3,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Container(
                width: 180,
                padding: const EdgeInsets.all(10),
                child: CustomNetworkImage(
                  imageSource: product.variants!.isEmpty
                      ? product.images[0]
                      : product.variants![0].image,
                  height: double.maxFinite,
                  width: double.maxFinite,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
