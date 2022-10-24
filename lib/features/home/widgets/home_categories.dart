import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/custom_network_image.dart';

class HomeCategories extends StatelessWidget {
  final Color color;
  final String categoryName;

  const HomeCategories({
    super.key,
    required this.color,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 110,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: const CustomNetworkImage(
                imageSource:
                    'https://ng.jumia.is/cms/0-1-homepage/0-0-thumbnails/v2/phones-tablets_220x220.png'),
          ),
          Text(
            categoryName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
