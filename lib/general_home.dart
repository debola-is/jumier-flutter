import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumier/features/help/screens/help_screen.dart';
import 'package:jumier/features/home/screens/category_screen.dart';
import 'package:jumier/features/home/screens/home_screen.dart';
import 'package:jumier/features/user/screens/account_screen.dart';

class GeneralHome extends StatefulWidget {
  const GeneralHome({super.key});

  @override
  State<GeneralHome> createState() => _GeneralHomeState();
}

class _GeneralHomeState extends State<GeneralHome> {
  int _currentPage = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const Center(
      child: Text('Feed'),
    ),
    const AccountScreen(),
    const HelpScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (value) {
          setState(() {
            _currentPage = value;
          });
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
}
