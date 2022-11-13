import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/constants.dart';

class SavedItemsScreen extends StatelessWidget {
  static const routeName = './cart/saved-items';
  const SavedItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(title: 'Saved Items', context: context),
      backgroundColor: backgroundGrey,
    );
  }
}
