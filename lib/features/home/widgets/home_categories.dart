import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(25),
              image: const DecorationImage(
                  image: CachedNetworkImageProvider(
                    'https://ng.jumia.is/cms/0-1-homepage/0-0-thumbnails/v2/phones-tablets_220x220.png',
                    maxHeight: 100,
                    maxWidth: 100,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Text(
            categoryName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
