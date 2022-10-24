import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/custom_network_image.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/features/product/screens/product_details_screen.dart';

class SubCategory extends StatelessWidget {
  final String subCategoryName;
  const SubCategory({
    super.key,
    required this.subCategoryName,
  });

  @override
  Widget build(BuildContext context) {
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
            itemCount: 6,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  navigateToProductDetails();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomNetworkImage(
                      imageSource:
                          'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/46/502258/1.jpg?4825',
                      height: (screenWidth(context) - 130) / 6,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Subcategory Name',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.fade,
                      maxLines: 2,
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
