import 'package:flutter/material.dart';
import 'package:jumier/constants.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageSource;
  final double height;
  final double width;
  final BoxFit fit;
  const CustomNetworkImage({
    super.key,
    required this.imageSource,
    required this.height,
    required this.width,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/cart-grey.jpg',
      image: imageSource,
      height: height,
      width: width,
      fit: fit,
      imageCacheHeight: height.floor(),
      imageCacheWidth: width.floor(),
      placeholderCacheHeight: height.floor(),
      placeholderCacheWidth: width.floor(),
      imageErrorBuilder: (context, error, stackTrace) => SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width / 2.5,
              vertical: height / 2.5,
            ),
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: shadeOfOrange,
            ),
          )),
    );
  }
}
