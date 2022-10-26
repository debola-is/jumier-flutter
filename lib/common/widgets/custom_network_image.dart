import 'package:flutter/material.dart';

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
      placeholder: 'assets/images/jumier.png',
      image: imageSource,
      height: height,
      width: width,
      fit: fit,
      imageCacheHeight: height.floor(),
      imageCacheWidth: width.floor(),
      placeholderCacheHeight: height.floor(),
      placeholderCacheWidth: width.floor(),
      imageErrorBuilder: (context, error, stackTrace) => Image.asset(
        'assets/images/jumier.png',
        height: height,
        width: width,
        fit: fit,
        cacheHeight: height.floor(),
        cacheWidth: width.floor(),
      ),
    );
  }
}
