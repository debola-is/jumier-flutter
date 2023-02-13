import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/constants.dart';

class VouchersScreen extends StatelessWidget {
  static const routeName = './user/account/vouchers';
  const VouchersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        title: 'Vouchers',
        context: context,
        showCart: true,
        showSearch: true,
      ),
      backgroundColor: backgroundGrey,
      body: Center(
        child: Text(
          'No availabe vouchers!',
          style: TextStyle(
            color: shadeOfOrange,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
