import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/common/widgets/carousel.dart';
import 'package:jumier/common/widgets/custom_loader.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/features/home/widgets/flash_sales.dart';
import 'package:jumier/features/home/widgets/home_categories.dart';
import 'package:jumier/features/home/widgets/top_rated.dart';
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
        progressIndicator: const CustomLoader(),
        inAsyncCall: _isLoading,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 30,
                width: double.infinity,
                color: Colors.red.shade700,
                child: const Center(
                  child: Text(
                    'FREE DELIVERY IN LAGOS, IBADAN AND ABUJA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const CarouselImages(),
              const SizedBox(
                height: 10,
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
              const FlashSales(),
              const TopRated(),
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
