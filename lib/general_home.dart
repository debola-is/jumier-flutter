import 'dart:async';
import 'dart:developer' as developer;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumier/common/utils/error_page_body.dart';
import 'package:jumier/features/feed/screens/feed_screen.dart';
import 'package:jumier/features/help/screens/help_screen.dart';
import 'package:jumier/features/home/screens/category_screen.dart';
import 'package:jumier/features/home/screens/home_screen.dart';
import 'package:jumier/features/user/screens/account_screen.dart';

int _currentPage = 0;
final List<Widget> _pages = [
  const HomeScreen(),
  const CategoryScreen(),
  const FeedScreen(),
  const AccountScreen(),
  const HelpScreen(),
];

class GeneralHome extends StatefulWidget {
  const GeneralHome({super.key});

  @override
  State<GeneralHome> createState() => _GeneralHomeState();
}

class _GeneralHomeState extends State<GeneralHome> {
  final Connectivity _connectivity = Connectivity();
  Widget? body;
  late StreamSubscription<ConnectivityResult> _connectivitySubsctiption;

  @override
  void initState() {
    super.initState();
    initConnection();
    _connectivitySubsctiption =
        _connectivity.onConnectivityChanged.listen(buildContent);
  }

  Future<void> initConnection() async {
    late ConnectivityResult result;

    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Could not check connectivity status', error: e);
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return buildContent(result);
  }

  Future<void> buildContent(ConnectivityResult result) async {
    changePage(
        result == ConnectivityResult.none
            ? const ErrorPageBody()
            : _pages[_currentPage],
        _currentPage);
  }

  void changePage(Widget page, int value) {
    setState(() {
      body = page;
      _currentPage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (value) {
          changePage(_pages[value], value);
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Categories',
            icon: Icon(
              Icons.list_alt_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Feed',
            icon: Icon(
              FontAwesomeIcons.squareRss,
              size: 16,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(
              Icons.person,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Help',
            icon: Icon(
              Icons.help_outline,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _connectivitySubsctiption.cancel();
  }
}
