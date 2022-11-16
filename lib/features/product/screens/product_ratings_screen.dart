import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/constants.dart';

class VerifiedCustomerFeedbackScreen extends StatelessWidget {
  static const routeName = './verifie-customer-feedback-screen';
  const VerifiedCustomerFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        title: 'Verified Customer Feedback',
        context: context,
        showCart: true,
        showHomeNavigator: true,
        showSearch: true,
      ),
      backgroundColor: backgroundGrey,
    );
  }
}
