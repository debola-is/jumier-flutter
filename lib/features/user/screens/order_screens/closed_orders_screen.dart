import 'package:flutter/material.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/features/user/widgets/single_order_widget.dart';

class ClosedOrdersScreen extends StatelessWidget {
  const ClosedOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      color: backgroundGrey,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return const SingleOrderWidget();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 10,
      ),
    );
  }
}
