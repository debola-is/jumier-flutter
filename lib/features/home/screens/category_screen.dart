import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/custom_scroll_behaviour.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/features/home/widgets/sub_category.dart';
import 'package:jumier/features/product/screens/see_all_products_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _activeIndex = 0;
  void changeActiveCategory(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String activeCategory =
        categoryAndSubCategories.keys.toList()[_activeIndex];
    return Scaffold(
        appBar: getSearchAppbar(context: context),
        backgroundColor: backgroundGrey,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              height: double.infinity,
              child: ListView.builder(
                itemCount: categoryAndSubCategories.keys.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    changeActiveCategory(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color:
                          _activeIndex == index ? backgroundGrey : Colors.white,
                      border: _activeIndex == index
                          ? const Border(
                              left: BorderSide(
                                color: Colors.orange,
                                width: 4,
                              ),
                            )
                          : null,
                    ),
                    height: 70,
                    child: Center(
                      child: Text(
                        categoryAndSubCategories.keys
                            .toList()[index]
                            .toTitleCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: _activeIndex == index
                              ? Colors.orange
                              : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: CustomScrollBehaviour(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => navigateToAllCategoryProducts(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 15.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "SEE ALL PRODUCTS",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.black,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                      for (int i = 0;
                          i < categoryAndSubCategories[activeCategory]!.length;
                          i++)
                        SubCategory(
                          subCategoryName:
                              categoryAndSubCategories[activeCategory]!
                                  .keys
                                  .toList()[i],
                          subSubCategoryNames:
                              categoryAndSubCategories[activeCategory]!
                                  .values
                                  .toList()[i],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void navigateToAllCategoryProducts() {
    Navigator.pushNamed(context, SeeAllProductsScreen.routeName,
        arguments: categoryAndSubCategories.keys.toList()[_activeIndex]);
  }
}
