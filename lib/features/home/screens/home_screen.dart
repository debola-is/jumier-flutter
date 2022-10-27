import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/features/home/widgets/carousel.dart';
import 'package:jumier/common/widgets/custom_loaders.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/features/home/widgets/collections.dart';
import 'package:jumier/features/home/widgets/flash_sales.dart';
import 'package:jumier/features/home/widgets/home_categories.dart';
import 'package:jumier/features/home/widgets/limited_deals.dart';
import 'package:jumier/features/home/widgets/top_deals.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getSearchAppbar(context: context),
      body: ModalProgressHUD(
        opacity: 0.6,
        color: backgroundGrey,
        progressIndicator: const NetworkLoadingAnimation(),
        inAsyncCall: _isLoading,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 30,
                width: double.infinity,
                color: Colors.red.shade800,
                child: const Center(
                  child: Text(
                    'Free Delivery in Lagos, Ibadan & Abuja',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const CarouselImages(),
              Container(
                height: 10,
                color: backgroundGrey,
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: categories
                      .map((e) => HomeCategories(
                          color: Colors.lightBlue, categoryName: e))
                      .toList(),
                ),
              ),
              Container(
                height: 10,
                color: backgroundGrey,
              ),
              const FlashSales(),
              Container(
                height: 10,
                color: backgroundGrey,
              ),
              const LimitedStockDeals(),
              Container(
                height: 10,
                color: backgroundGrey,
              ),
              const TopDeals(),
              Container(
                height: 10,
                color: backgroundGrey,
              ),
              const Collection(),
              Container(
                height: 10,
                color: backgroundGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> categories = [
    'Brand Festival',
    'Computing',
    'Jumia Games',
    'Best Price',
    'Phones & Tablets',
    'Groceries',
    'Appliances',
    'Combo Deals',
  ];

  Future<void> submit() async {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }
}
