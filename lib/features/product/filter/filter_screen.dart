import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jumier/common/widgets/custom_button.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/features/product/filter/select_options_screen.dart';
import 'package:jumier/features/product/filter/widgets/filter_appbar.dart';
import 'package:jumier/features/user/widgets/account_action.dart';

List<int> discounts = [10, 20, 30, 40, 50];
List<int> ratings = [1, 2, 3, 4];
List<int> sellerScores = [20, 40, 60, 80];
List<String> shippedFromList = ['abroad', 'local'];
List<String> deliveryList = ['express delivery'];

class FilterScreen extends StatefulWidget {
  static const String routeName = '/filter-screen';
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int? _selectedCategory;
  int? _appliedDiscount;
  int? _rating;
  int? _sellerScore;
  int? _shippedFrom;
  int? _delivery;
  RangeValues? _priceRange;

  @override
  void initState() {
    super.initState();
    resetFilters();
  }

  void resetFilters() {
    _priceRange = const RangeValues(0, 200);
    _selectedCategory = null;
    _appliedDiscount = 0;
    _rating = 0;
    _sellerScore = 0;
    _shippedFrom = null;
    _delivery = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: FilterAppBar(
          title: 'Filter',
          trailing: Text(
            'CLEAR ALL',
            style: TextStyle(
              color: shadeOfOrange,
              fontSize: 12,
            ),
          ),
          trailingOnTap: () {
            setState(() {
              resetFilters();
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              AccountAction(
                onTap: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    SelectOptionScreen.routeName,
                    arguments: {
                      'options': categoryAndSubCategories.keys.toList(),
                      'title': 'Category',
                      'selectedOption': _selectedCategory,
                    },
                  );
                  if (result != null) {
                    _selectedCategory = result as int;
                    setState(() {});
                  }
                },
                title: 'Category',
                trailingSelected: _selectedCategory == null
                    ? null
                    : categoryAndSubCategories.keys
                        .toList()[_selectedCategory!]
                        .toTitleCase(),
                titleTextStyle: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Divider(
                height: 0,
                indent: 20,
                thickness: 1.5,
                endIndent: 20,
                color: backgroundGrey,
              ),
              AccountAction(
                onTap: () {},
                title: 'Brand',
                titleTextStyle: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Divider(
                height: 0,
                indent: 20,
                thickness: 1.5,
                endIndent: 20,
                color: backgroundGrey,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Price (₦)',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'FROM',
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                width: (screenWidth(context) - 80) / 2,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  '${_priceRange!.start.toInt()}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'TO',
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                width: (screenWidth(context) - 80) / 2,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  '${_priceRange!.end.toInt()}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliderTheme(
                data: SliderThemeData(
                  activeTickMarkColor: Colors.transparent,
                  activeTrackColor: shadeOfOrange,
                  thumbColor: shadeOfOrange,
                  inactiveTickMarkColor: Colors.transparent,
                  trackHeight: 2,
                  overlayColor: Colors.transparent,
                  rangeThumbShape: const RoundRangeSliderThumbShape(
                    enabledThumbRadius: 10,
                    pressedElevation: 2.5,
                    elevation: 5,
                  ),
                ),
                child: RangeSlider(
                    values: _priceRange!,
                    min: 0,
                    max: 1000,
                    divisions: 20,
                    onChanged: (RangeValues values) {
                      setState(
                        () {
                          _priceRange = values;
                        },
                      );
                    }),
              ),
              if (_priceRange != const RangeValues(0, 200))
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Text(
                          'APPLY',
                          style: TextStyle(
                            color: shadeOfOrange,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _priceRange = const RangeValues(0, 200);
                          setState(() {});
                        },
                        child: Text(
                          'RESET',
                          style: TextStyle(
                            color: shadeOfOrange,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Divider(
                height: 2,
                indent: 20,
                endIndent: 20,
                thickness: 1.5,
                color: backgroundGrey,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AccountAction(
                    onTap: () {},
                    title: 'Discount Percentage',
                    titleTextStyle: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    trailingWidget: _appliedDiscount == 0
                        ? const SizedBox()
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                _appliedDiscount = 0;
                              });
                            },
                            child: Text(
                              'RESET',
                              style: TextStyle(
                                color: shadeOfOrange,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ),
                  for (int i = 0; i < discounts.length; i++)
                    AccountAction(
                      onTap: () {},
                      leadingWidget: Radio(
                          toggleable: true,
                          value: discounts.reversed.toList()[i],
                          groupValue: _appliedDiscount,
                          onChanged: (int? value) {
                            setState(() {
                              _appliedDiscount = value!;
                            });
                          }),
                      title: '${discounts.reversed.toList()[i]}% or more',
                      trailingWidget: const SizedBox(),
                    ),
                ],
              ),
              Divider(
                height: 2,
                indent: 20,
                endIndent: 20,
                thickness: 1.5,
                color: backgroundGrey,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AccountAction(
                    onTap: () {},
                    title: 'Product Rating',
                    titleTextStyle: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    trailingWidget: _rating == 0
                        ? const SizedBox()
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                _rating = 0;
                              });
                            },
                            child: Text(
                              'RESET',
                              style: TextStyle(
                                color: shadeOfOrange,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ),
                  for (int i = 0; i < ratings.length; i++)
                    AccountAction(
                      onTap: () {},
                      leadingWidget: Radio(
                          toggleable: true,
                          value: ratings.reversed.toList()[i],
                          groupValue: _rating,
                          onChanged: (int? value) {
                            setState(() {
                              _rating = value!;
                            });
                          }),
                      title: '${ratings.reversed.toList()[i]}% or more',
                      titleWidget: Row(
                        children: [
                          RatingBarIndicator(
                            rating: ratings.reversed.toList()[i].toDouble(),
                            itemSize: 15,
                            itemBuilder: (context, _) {
                              return const Icon(
                                Icons.star,
                                color: Colors.orange,
                              );
                            },
                          ),
                          const Text(
                            ' & above',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      trailingWidget: const SizedBox(),
                    ),
                ],
              ),
              Divider(
                height: 2,
                indent: 20,
                endIndent: 20,
                thickness: 1.5,
                color: backgroundGrey,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AccountAction(
                    onTap: () {},
                    title: 'Seller Score',
                    titleTextStyle: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    trailingWidget: _sellerScore == 0
                        ? const SizedBox()
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                _sellerScore = 0;
                              });
                            },
                            child: Text(
                              'RESET',
                              style: TextStyle(
                                color: shadeOfOrange,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ),
                  for (int i = 0; i < sellerScores.length; i++)
                    AccountAction(
                      onTap: () {},
                      leadingWidget: Radio(
                          toggleable: true,
                          value: sellerScores.reversed.toList()[i],
                          groupValue: _sellerScore,
                          onChanged: (int? value) {
                            setState(() {
                              _sellerScore = value!;
                            });
                          }),
                      title: '${sellerScores.reversed.toList()[i]}% or more',
                      trailingWidget: const SizedBox(),
                    ),
                ],
              ),
              Divider(
                height: 2,
                indent: 20,
                endIndent: 20,
                thickness: 1.5,
                color: backgroundGrey,
              ),
              AccountAction(
                  onTap: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      SelectOptionScreen.routeName,
                      arguments: {
                        'options': shippedFromList,
                        'title': 'Shipping Location',
                        'selectedOption': _shippedFrom,
                      },
                    );
                    if (result != null) {
                      _shippedFrom = result as int;
                    }
                  },
                  title: 'Shipped From'),
              Divider(
                height: 2,
                indent: 20,
                endIndent: 20,
                thickness: 1.5,
                color: backgroundGrey,
              ),
              AccountAction(
                  onTap: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      SelectOptionScreen.routeName,
                      arguments: {
                        'options': deliveryList,
                        'title': 'Express Delivery',
                        'selectedOption': _delivery,
                      },
                    );
                    if (result != null) {
                      _delivery = result as int;
                    }
                  },
                  title: 'Express Delivery'),
            ],
          ),
        ),
      ),
      backgroundColor: backgroundGrey,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: CustomButton(
          onTap: () {},
          text: 'SAVE (100)',
        ),
      ),
    );
  }
}
