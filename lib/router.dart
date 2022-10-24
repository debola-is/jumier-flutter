import 'package:flutter/material.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/features/product/filter/filter_screen.dart';
import 'package:jumier/features/product/screens/product_details_screen.dart';
import 'package:jumier/features/product/screens/see_all_category_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SeeAllCategoryScreen.routeName:
      var categoryName = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => SeeAllCategoryScreen(categoryName: categoryName),
      );

    case ProductDetailsScreen.routeName:
      var productName = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => ProductDetailsScreen(productName: productName),
      );

    case FilterScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const FilterScreen(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => Scaffold(
          backgroundColor: backgroundGrey,
          body: Center(
            child: Text(
              "404! Page does not exist",
              style: TextStyle(
                color: shadeOfOrange,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      );
  }
}
