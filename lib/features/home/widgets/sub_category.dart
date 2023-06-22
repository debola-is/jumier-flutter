import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/custom_loaders.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/features/product/screens/product_details_screen.dart';

class SubCategory extends StatelessWidget {
  final String subCategoryName;
  final List<String> subSubCategoryNames;
  const SubCategory({
    super.key,
    required this.subCategoryName,
    required this.subSubCategoryNames,
  });

  @override
  Widget build(BuildContext context) {
    double imageHeight = (screenWidth(context) - 130) / 6;
    void navigateToProductDetails() {
      Navigator.pushNamed(context, ProductDetailsScreen.routeName,
          arguments: 'ProductName');
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subCategoryName.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                const Text(
                  'SEE ALL',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: backgroundGrey,
            margin: const EdgeInsets.only(bottom: 15),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: subSubCategoryNames.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  navigateToProductDetails();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/46/502258/1.jpg?4825',
                      height: imageHeight,
                      memCacheHeight: 125,
                      memCacheWidth: 125,
                      placeholder: (context, url) => Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: imageHeight * 0.8,
                            vertical: imageHeight * 0.3),
                        child: const ImageLoadingAnimation(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        subSubCategoryNames[index].toTitleCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
