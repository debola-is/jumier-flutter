import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/features/admin/screens/admin_add_products_screen.dart';
import 'package:jumier/features/admin/screens/admin_products_screen.dart';
import 'package:jumier/features/cart/screens/cart_screen.dart';
import 'package:jumier/features/cart/screens/recently_viewed_screen.dart';
import 'package:jumier/features/cart/screens/saved_items_screen.dart';
import 'package:jumier/features/product/filter/filter_screen.dart';
import 'package:jumier/features/product/filter/select_options_screen.dart';
import 'package:jumier/features/product/screens/product_details_screen.dart';
import 'package:jumier/features/product/screens/verified_customer_feedback.dart';
import 'package:jumier/features/product/screens/see_all_products_screen.dart';
import 'package:jumier/features/user/screens/add_new_address.dart';
import 'package:jumier/features/user/screens/address_book_screen.dart';
import 'package:jumier/features/user/screens/all_orders_screen.dart';
import 'package:jumier/features/user/screens/close_account_screen.dart';
import 'package:jumier/features/user/screens/order_screens/order_details_screen.dart';
import 'package:jumier/features/user/screens/order_screens/order_tracking_screen.dart';
import 'package:jumier/features/user/screens/pending_reviews_screen.dart';
import 'package:jumier/features/user/screens/rate_product_screen.dart';
import 'package:jumier/features/user/screens/recently_searched_screen.dart';
import 'package:jumier/features/user/screens/vouchers_screen.dart';
import 'package:jumier/general_home.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case GeneralHome.routeName:
      var page = routeSettings.arguments as int;
      return CupertinoPageRoute(
        builder: (_) => GeneralHome(
          pageToDisplayOnNavigate: page,
        ),
      );
    case SeeAllProductsScreen.routeName:
      var categoryName = routeSettings.arguments as String;
      return CupertinoPageRoute(
        builder: (_) => SeeAllProductsScreen(categoryName: categoryName),
      );

    case ProductDetailsScreen.routeName:
      var productName = routeSettings.arguments as String;
      return CupertinoPageRoute(
        builder: (_) => ProductDetailsScreen(productName: productName),
      );

    case VerifiedCustomerFeedbackScreen.routeName:
      return CupertinoPageRoute(
        builder: (_) => const VerifiedCustomerFeedbackScreen(),
      );

    case FilterScreen.routeName:
      return CupertinoPageRoute(
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

    case SavedItemsScreen.routeName:
      return CupertinoPageRoute(
        builder: (_) => const SavedItemsScreen(),
      );
    case RecentlyViewedScreen.routeName:
      return CupertinoPageRoute(
        builder: (_) => const RecentlyViewedScreen(),
      );

    case VerifiedCustomerFeedbackScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const VerifiedCustomerFeedbackScreen(),
      );

    case AdminProductsScreen.routeName:
      return CupertinoPageRoute(
        builder: (_) => const AdminProductsScreen(),
      );
    case AdminAddProductScreen.routeName:
      return CupertinoPageRoute(
        builder: (_) => const AdminAddProductScreen(),
      );
    case OrdersScreen.routeName:
      return CupertinoPageRoute(
        builder: (_) => const OrdersScreen(),
      );
    case PendingReviewsScreen.routeName:
      return CupertinoPageRoute(
        builder: (_) => const PendingReviewsScreen(),
      );
    case RateProductScreen.routeName:
      return CupertinoPageRoute(
        builder: (_) => const RateProductScreen(),
      );
    case VouchersScreen.routeName:
      return CupertinoPageRoute(
        builder: (_) => const VouchersScreen(),
      );
    case RecentlySearchedScreen.routeName:
      return CupertinoPageRoute(
        builder: (_) => const RecentlySearchedScreen(),
      );
    case OrderDetailsScreen.routeName:
      // TODO:
      // Order arguments = routeSettings.arguments as Order;
      return CupertinoPageRoute(
        builder: (_) => const OrderDetailsScreen(order: null),
      );
    case OrderTrackingScreen.routeName:
      // TODO: parse the correct input for order status
      // int arguments = routeSettings.arguments as int;
      return CupertinoPageRoute(
        builder: (_) => const OrderTrackingScreen(
          status: 0,
        ),
      );

    case AddressBookScreen.routeName:
      return CupertinoPageRoute(
        builder: (_) => const AddressBookScreen(),
      );
    case AddNewAddressScreen.routeName:
      // Address address = routeSettings.arguments as Address;
      return CupertinoPageRoute(
        builder: (_) => const AddNewAddressScreen(),
      );
    case CloseAccountScreen.routeName:
      return CupertinoPageRoute(
        builder: (_) => const CloseAccountScreen(),
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
