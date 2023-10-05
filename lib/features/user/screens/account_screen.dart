import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/common/widgets/custom_button.dart';
import 'package:jumier/common/widgets/custom_scroll_behaviour.dart';
import 'package:jumier/features/auth/sign_in_screen.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/features/admin/screens/admin_products_screen.dart';
import 'package:jumier/features/cart/screens/recently_viewed_screen.dart';
import 'package:jumier/features/cart/screens/saved_items_screen.dart';
import 'package:jumier/features/user/screens/address_book_screen.dart';
import 'package:jumier/features/user/screens/all_orders_screen.dart';
import 'package:jumier/features/user/screens/close_account_screen.dart';
import 'package:jumier/features/user/screens/pending_reviews_screen.dart';
import 'package:jumier/features/user/screens/recently_searched_screen.dart';
import 'package:jumier/features/user/screens/vouchers_screen.dart';
import 'package:jumier/features/user/widgets/account_action.dart';
import 'package:jumier/features/user/widgets/info_tab.dart';
import 'package:jumier/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  void gotoLogin() {
    Navigator.pushNamed(
      context,
      SignInScreen.routeName,
    );
  }

  void logout() {
    Navigator.pop(context);

    setState(() {
      Provider.of<UserProvider>(context, listen: false).resetUser();
      log(
        Provider.of<UserProvider>(context, listen: false).user.email,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    return Scaffold(
      appBar: getAppbar(
        title: 'Account',
        context: context,
        showSearch: true,
        showCart: true,
      ),
      backgroundColor: backgroundGrey,
      body: Column(
        children: [
          user.token.isEmpty
              ? Container(
                  padding: const EdgeInsets.all(10),
                  height: 60,
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  color: shadeOfBlack,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Welcome!',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Enter your account',
                              style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: CustomButton(
                          text: "login",
                          color: Colors.amber.shade800,
                          height: 40,
                          onTap: gotoLogin,
                        ),
                      )
                    ],
                  ),
                )
              : Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  color: shadeOfBlack,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome ${user.firstName}!',
                        style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        user.email,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
          Expanded(
            child: ScrollConfiguration(
              behavior: CustomScrollBehaviour(),
              child: ListView(
                children: [
                  const InfoTab(description: 'MY JUMIER ACCOUNT'),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        AccountAction(
                          restictedToSignedInUser: true,
                          onTap: () {
                            Navigator.pushNamed(
                                context, OrdersScreen.routeName);
                          },
                          title: 'Orders',
                          iconData: FontAwesomeIcons.box,
                        ),
                        AccountAction(
                          onTap: () {
                            showSnackBar(
                              context,
                              'Coming soon in future update',
                              ErrorType.warning,
                            );
                          },
                          title: 'Inbox',
                          restictedToSignedInUser: true,
                          iconData: Icons.mail_outline_rounded,
                        ),
                        AccountAction(
                          onTap: () {
                            Navigator.pushNamed(
                                context, PendingReviewsScreen.routeName);
                          },
                          title: 'Ratings & Reviews',
                          restictedToSignedInUser: true,
                          iconData: Icons.rate_review_outlined,
                        ),
                        AccountAction(
                          onTap: () {
                            Navigator.pushNamed(
                                context, VouchersScreen.routeName);
                          },
                          title: 'Vouchers',
                          restictedToSignedInUser: true,
                          iconData: FontAwesomeIcons.ticket,
                        ),
                        AccountAction(
                          onTap: () {
                            Navigator.pushNamed(
                                context, SavedItemsScreen.routeName);
                          },
                          title: 'Saved Items',
                          restictedToSignedInUser: true,
                          iconData: FontAwesomeIcons.heart,
                        ),
                        AccountAction(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RecentlyViewedScreen.routeName);
                          },
                          title: 'Recently Viewed',
                          iconData: FontAwesomeIcons.clockRotateLeft,
                        ),
                        AccountAction(
                          onTap: () {
                            log(user.token);
                            Navigator.pushNamed(
                                context, RecentlySearchedScreen.routeName);
                          },
                          title: 'Recently Searched',
                          iconData: Icons.youtube_searched_for,
                        ),
                        if (user.userType == 'admin')
                          AccountAction(
                            onTap: navigateToAdmin,
                            title: 'Admin',
                            iconData: Icons.admin_panel_settings,
                          ),
                      ],
                    ),
                  ),
                  const InfoTab(description: 'MY SETTINGS'),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        AccountAction(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AddressBookScreen.routeName);
                          },
                          title: 'Address Book',
                        ),
                        AccountAction(
                          onTap: () {},
                          title: 'Account Management',
                        ),
                        AccountAction(
                          onTap: () {
                            Navigator.pushNamed(
                                context, CloseAccountScreen.routeName);
                          },
                          title: 'Close Account',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    width: 150,
                    child: user.token.isEmpty
                        ? SignInButton(
                            login: gotoLogin,
                          )
                        : LogOutButton(logout: logout),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToAdmin() {
    Navigator.pushNamed(context, AdminProductsScreen.routeName);
  }
}

class LogOutButton extends StatelessWidget {
  final VoidCallback logout;
  const LogOutButton({
    required this.logout,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              insetPadding: EdgeInsets.zero,
              title: const Text(
                'Logout Confirmation',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              content: const Text(
                'Are you sure you want to exit?',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: logout,
                  child: const Text(
                    'YES',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('NO'),
                ),
              ],
            );
          },
        );
      },
      child: const Text(
        'Logout',
        style: TextStyle(
          color: Colors.orange,
          fontSize: 18,
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  final VoidCallback login;
  const SignInButton({
    required this.login,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: login,
      child: const SizedBox(
        width: 120,
        child: Text(
          'Log In',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.orange,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
