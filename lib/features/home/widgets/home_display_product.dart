import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/custom_network_image.dart';

class HomeDisplayProduct extends StatelessWidget {
  final double height;
  final double width;
  final String imageSource;
  const HomeDisplayProduct({
    super.key,
    this.height = 100,
    this.width = 100,
    required this.imageSource,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              Container(
                alignment: Alignment.center,
                height: 25,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                ),
                child: const Text(
                  '-38%',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          CustomNetworkImage(
            imageSource: imageSource,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Product Name',
            overflow: TextOverflow.ellipsis,
          ),
          const Text(
            '₦150,000',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
