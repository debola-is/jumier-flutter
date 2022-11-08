import 'package:flutter/material.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/features/cart/cart_screen.dart';
import 'package:jumier/features/feed/screens/feed_screen.dart';
import 'package:jumier/features/help/screens/help_screen.dart';
import 'package:jumier/features/home/screens/category_screen.dart';
import 'package:jumier/features/home/screens/home_screen.dart';
import 'package:jumier/features/search/screens/search_screen.dart';
import 'package:jumier/features/user/screens/account_screen.dart';

PreferredSizeWidget getAppbar({
  required String title,
  required BuildContext context,
  Widget? titleWidget,
  bool? isCart = false,
}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: shadeOfBlack,
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: titleWidget ??
                Text(
                  title.toTitleCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
          ),
          if (!isCart!)
            if (titleWidget == null)
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 4),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SearchScreen();
                        },
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.search_outlined,
                    size: 22,
                  ),
                ),
              ),
          if (!isCart)
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 4),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 22,
                ),
              ),
            ),
        ],
      ),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      actions: [
        if (isCart)
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 4),
            child: PopupMenuButton(
              itemBuilder: (context) {
                return cartChoices.keys
                    .toList()
                    .map((e) => PopupMenuItem(child: Text(e)))
                    .toList();
              },
            ),
          ),
      ],
    ),
  );
}

PreferredSizeWidget getSearchAppbar({
  required BuildContext context,
}) {
  final TextEditingController searchController = TextEditingController();
  return getAppbar(
    title: '',
    context: context,
    titleWidget: TextField(
      controller: searchController,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(0),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black45,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orange,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        constraints: BoxConstraints.expand(height: 40),
        hintText: 'Search for Products, Brands...',
        prefixIcon: Icon(
          Icons.search_outlined,
        ),
      ),
    ),
  );
}

const cartChoices = {
  'home': HomeScreen(),
  'categories': CategoryScreen(),
  'feed': FeedScreen(),
  'account': AccountScreen(),
  'help': HelpScreen(),
};
