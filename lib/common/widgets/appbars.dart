import 'package:flutter/material.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/features/cart/screens/cart_screen.dart';
import 'package:jumier/features/search/screens/search_screen.dart';
import 'package:jumier/general_home.dart';

PreferredSizeWidget getAppbar({
  required String title,
  required BuildContext context,
  Size? size,
  Widget? titleWidget,
  bool? showSearch = false,
  bool? showCart = false,
  bool? showHomeNavigator = false,
  PreferredSizeWidget? bottom,
}) {
  return PreferredSize(
    preferredSize: size ?? const Size.fromHeight(60),
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
        ],
      ),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      actions: [
        if (showSearch!)
          GestureDetector(
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
        if (showCart!)
          Padding(
            padding: EdgeInsets.only(
                left: showSearch ? 15 : 0, right: showHomeNavigator! ? 0 : 15),
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
        if (showHomeNavigator!)
          PopupMenuButton(
            icon: const Icon(
              Icons.more_horiz,
              size: 24,
            ),
            padding: const EdgeInsets.all(0),
            itemBuilder: (context) {
              return generalHomeCategories.keys
                  .toList()
                  .map(
                    (e) => PopupMenuItem(
                      padding: const EdgeInsets.all(0),
                      height: 40,
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: screenWidth(context) / 2,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              GeneralHome.routeName,
                              (route) => false,
                              arguments: generalHomeCategories.keys
                                  .toList()
                                  .indexOf(e),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                generalHomeCategories[e]![1],
                                color: Colors.black87,
                                size: 22,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                e,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList();
            },
          ),
      ],
      bottom: bottom,
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
    showCart: true,
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
            Radius.circular(5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orange,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
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
