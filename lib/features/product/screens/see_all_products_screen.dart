import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/features/product/filter/filter_screen.dart';
import 'package:jumier/features/product/widgets/category_single_product.dart';

enum Layout {
  grid,
  list,
}

class SeeAllProductsScreen extends StatefulWidget {
  static const routeName = '/see-all-category-screen';
  final String categoryName;

  const SeeAllProductsScreen({
    super.key,
    required this.categoryName,
  });

  @override
  State<SeeAllProductsScreen> createState() => _SeeAllProductsScreenState();
}

class _SeeAllProductsScreenState extends State<SeeAllProductsScreen> {
  var selectedLayout = Layout.grid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(title: widget.categoryName, context: context),
      body: Column(
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
          Expanded(
              child: selectedLayout == Layout.list
                  ? ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const CategorySingleProduct(
                          layout: Layout.list,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 0,
                          thickness: 10,
                          color: backgroundGrey,
                        );
                      },
                      itemCount: 15,
                    )
                  : GridView.builder(
                      itemCount: 15,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 260,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.6,
                      ),
                      itemBuilder: (context, index) {
                        return const CategorySingleProduct(
                          layout: Layout.grid,
                        );
                      },
                    )),
        ],
      ),
    );
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
