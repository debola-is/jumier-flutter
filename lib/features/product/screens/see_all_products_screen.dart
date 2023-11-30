import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/features/product/filter/filter_screen.dart';
import 'package:jumier/features/product/widgets/category_single_product.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/models/product.dart';
import 'package:jumier/services/product_services.dart';

class SeeAllProductsScreen extends StatefulWidget {
  static const routeName = '/see-all-category-screen';
  final String category;
  final String subCategory;
  final String subSubCategory;

  const SeeAllProductsScreen({
    super.key,
    required this.category,
    required this.subCategory,
    required this.subSubCategory,
  });

  @override
  State<SeeAllProductsScreen> createState() => _SeeAllProductsScreenState();
}

class _SeeAllProductsScreenState extends State<SeeAllProductsScreen>
    with SingleTickerProviderStateMixin {
  var selectedLayout = Layout.grid;
  final ProductServices _productServices = ProductServices();
  List<Product>? _allProducts;
  bool isLoading = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  Future<void> getProducts() async {
    setState(() {
      isLoading = true;
    });
    _allProducts = await _productServices.getProducts(
      context: context,
      category: widget.category,
      subCategory: widget.subCategory,
      subSubCategory: widget.subSubCategory,
    );

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
    _controller.forward();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    getProducts();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppbar(
          title: widget.subSubCategory.isNotEmpty
              ? widget.subSubCategory.split("#")[0]
              : widget.subCategory.isNotEmpty
                  ? widget.subCategory
                  : widget.category.isNotEmpty
                      ? widget.category
                      : "Products",
          showHomeNavigator: true,
          showCart: true,
          showSearch: true,
          context: context,
        ),
        backgroundColor: Colors.grey.shade300,
        body: RefreshIndicator(
          onRefresh: getProducts,
          child: Column(
            children: [
              Container(
                height: 40,
                color: shadeOfBlack,
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: IconButton(
                        onPressed: () {
                          changeLayout();
                        },
                        icon: Icon(
                          selectedLayout == Layout.grid
                              ? Icons.grid_view
                              : Icons.view_list,
                          size: 18,
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      color: Colors.grey.shade600,
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'POPULARITY',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          DropdownButton(
                            underline: const SizedBox(),
                            items: const [],
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      color: Colors.grey.shade600,
                    ),
                    Expanded(
                      flex: 4,
                      child: GestureDetector(
                        onTap: navigateToFilters,
                        child: const Text(
                          'FILTERS',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _allProducts == null
                  ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Getting Products..",
                            style: TextStyle(color: shadeOfOrange),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CircularProgressIndicator(
                            color: shadeOfOrange,
                            strokeWidth: 2,
                          )
                        ],
                      ),
                    )
                  : Expanded(
                      child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        _controller.reverse();
                        _controller.forward();
                        return FadeTransition(
                          opacity: _animation,
                          child: selectedLayout == Layout.list
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return CategorySingleProduct(
                                      layout: Layout.list,
                                      productData: _allProducts![index],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                  itemCount: _allProducts!.length,
                                )
                              : GridView.builder(
                                  itemCount: _allProducts!.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 260,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 0.55,
                                  ),
                                  itemBuilder: (context, index) {
                                    return CategorySingleProduct(
                                      layout: Layout.grid,
                                      productData: _allProducts![index],
                                    );
                                  },
                                ),
                        );
                      },
                    )),
            ],
          ),
        ));
  }

  void changeLayout() {
    if (selectedLayout == Layout.grid) {
      setState(() {
        selectedLayout = Layout.list;
      });
    } else {
      setState(() {
        selectedLayout = Layout.grid;
      });
    }
  }

  void navigateToFilters() {
    Navigator.pushNamed(context, FilterScreen.routeName);
  }
}
