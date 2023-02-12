import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/features/admin/screens/admin_products_screen.dart';
import 'package:jumier/features/user/screens/all_orders_screen.dart';
import 'package:jumier/features/user/widgets/account_action.dart';
import 'package:jumier/features/user/widgets/info_tab.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
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
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            width: double.infinity,
            color: shadeOfBlack,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome Adebola!',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'debola@test.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
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
                        onTap: () {
                          Navigator.pushNamed(context, OrdersScreen.routeName);
                        },
                        title: 'Orders',
                        iconData: FontAwesomeIcons.box,
                      ),
                      AccountAction(
                        onTap: () {
                          showSnackBar(
                              context, 'Coming soon in future update', 'other');
                        },
                        title: 'Inbox',
                        iconData: Icons.mail_outline_rounded,
                      ),
                      AccountAction(
                        onTap: () {},
                        title: 'Ratings & Reviews',
                        iconData: Icons.rate_review_outlined,
                      ),
                      AccountAction(
                        onTap: () {},
                        title: 'Vouchers',
                        iconData: FontAwesomeIcons.ticket,
                      ),
                      AccountAction(
                        onTap: () {},
                        title: 'Saved Items',
                        iconData: FontAwesomeIcons.heart,
                      ),
                      AccountAction(
                        onTap: () {},
                        title: 'Recently Viewed',
                        iconData: FontAwesomeIcons.clockRotateLeft,
                      ),
                      AccountAction(
                        onTap: () {},
                        title: 'Recently Searched',
                        iconData: Icons.youtube_searched_for,
                      ),
                      AccountAction(
                        onTap: () {},
                        title: 'Jumier Prime',
                        iconData: FontAwesomeIcons.crown,
                      ),
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
                        onTap: () {},
                        title: 'Address Book',
                      ),
                      AccountAction(
                        onTap: () {},
                        title: 'Account Management',
                      ),
                      AccountAction(
                        onTap: () {},
                        title: 'Close Account',
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
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
