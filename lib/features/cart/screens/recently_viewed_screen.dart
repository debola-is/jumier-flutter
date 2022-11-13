import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/constants.dart';

class RecentlyViwedScreen extends StatelessWidget {
  static const routeName = './cart/recently-viewed';
  const RecentlyViwedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(title: 'Recently Viewed', context: context),
      backgroundColor: backgroundGrey,
    );
  }
}
