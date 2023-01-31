import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/features/user/screens/order_screens/closed_orders_screen.dart';
import 'package:jumier/features/user/screens/order_screens/open_orders_screen.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = './account/orders-screen';
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final List<Widget> _orderPages = [
    const OpenOrdersScreen(),
    const ClosedOrdersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: getAppbar(
          title: 'Orders',
          context: context,
          showSearch: true,
          showCart: true,
          size: const Size.fromHeight(100),
          bottom: const TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(
                text: 'OPEN',
              ),
              Tab(
                text: 'CLOSED',
              ),
            ],
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: TabBarView(
          children: _orderPages,
        ),
      ),
    );
  }
}
