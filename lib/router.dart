import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/features/cart/cart_screen.dart';
import 'package:jumier/features/product/filter/filter_screen.dart';
import 'package:jumier/features/product/filter/select_options_screen.dart';
import 'package:jumier/features/product/screens/product_details_screen.dart';
import 'package:jumier/features/product/screens/see_all_products_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SeeAllProductsScreen.routeName:
      var categoryName = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => SeeAllProductsScreen(categoryName: categoryName),
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

    case SelectOptionScreen.routeName:
      Map<String, dynamic> arguments =
          routeSettings.arguments as Map<String, dynamic>;
      return CupertinoPageRoute(
        builder: (_) => SelectOptionScreen(
          options: arguments['options'],
          title: arguments['title'],
          selectedOption: arguments['selectedOption'],
        ),
      );

    case CartScreen.routeName:
      return CupertinoPageRoute(
        builder: (_) => const CartScreen(),
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
