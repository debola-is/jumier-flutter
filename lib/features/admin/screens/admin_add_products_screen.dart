// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/common/widgets/custom_button.dart';
import 'package:jumier/common/widgets/custom_text_field.dart';
import 'package:jumier/constants.dart';

class AdminAddProductScreen extends StatefulWidget {
  static const String routeName = '/admin_add_product_screen';

  const AdminAddProductScreen({super.key});

  @override
  State<AdminAddProductScreen> createState() => _AdminAddProductScreenState();
}

class _AdminAddProductScreenState extends State<AdminAddProductScreen> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final _adminProductFormKey = GlobalKey<FormState>();

// Need to create variantName, variantPrice and variantQuantity text editing controllers on demand when user adds a new variant with the add button.

  bool hasVariants = false;
  String? _category;
  String? _subCategory;
  String? _subSubCategory;
  List<File> images = [];

  Widget displayImagesCount() {
    int count = images.length;
    String text = count > 0
        ? count > 1
            ? '$count images selected'
            : '$count image selected'
        : 'No image selected';
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: shadeOfOrange,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // At init state, set the default values for selected category, sub category and sub sub category. All values are set to the first item in the iterable containing all their available values.

    _category = categoryAndSubCategories.keys.toList()[0];
    _subCategory = categoryAndSubCategories[_category]!.keys.toList()[0];
    _subSubCategory = categoryAndSubCategories[_category]![_subCategory]![0];
  }

  @override
  void dispose() {
    super.dispose();
    _productNameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _brandController.dispose();
    _quantityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(title: 'Add New Product', context: context),
      body: SingleChildScrollView(
        child: Form(
          key: _adminProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ).copyWith(
              bottom: 20,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map(
                          (i) {
                            return Stack(
                              children: [
                                Builder(
                                  builder: (BuildContext context) => Image.file(
                                    i,
                                    fit: BoxFit.contain,
                                    height: 200,
                                    width: double.infinity,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      deleteImage(i);
                                    },
                                    child: Badge(
                                      badgeColor: Colors.white,
                                      position: BadgePosition.topStart(),
                                      badgeContent: const Icon(
                                        Icons.delete_outline,
                                        size: 20,
                                        color: Colors.cyan,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 45,
                                  child: GestureDetector(
                                    onTap: () {
                                      getImages();
                                    },
                                    child: Badge(
                                      badgeColor: Colors.white,
                                      position: BadgePosition.topStart(),
                                      badgeContent: const Icon(
                                        Icons.add_a_photo_outlined,
                                        size: 20,
                                        color: Colors.cyan,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : GestureDetector(
                        onTap: getImages,
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.folder_open,
                                size: 40,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Select Product Images',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                displayImagesCount(),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: _productNameController,
                  hintText: 'Product Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: _brandController,
                  hintText: 'Brand Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: _descriptionController,
                  hintText: 'Description',
                  inputType: TextInputType.multiline,
                  maxLines: 7,
                ),
                const SizedBox(
                  height: 10,
                ),
                CheckboxListTile(
                  value: hasVariants,
                  onChanged: (value) {
                    setState(() {
                      hasVariants = value!;
                    });
                  },
                  title: const Text('Has variants? '),
                ),

                // If hasVariants is true, we want to show text fields to enter the name, price and quantity of the variant, else we want just one text field each for the price of the product and the quantity of the product in stock.

                if (!hasVariants)
                  Column(
                    children: [
                      CustomTextField(
                        controller: _priceController,
                        hintText: 'Price',
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _quantityController,
                        hintText: 'Quantity',
                        inputType: TextInputType.number,
                      ),
                    ],
                  ),

                if (hasVariants)

                  // TODO: Change controllers
                  Column(
                    children: [
                      CustomTextField(
                        controller: _priceController,
                        hintText: 'Variant Name',
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _priceController,
                        hintText: 'Price',
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _quantityController,
                        hintText: 'Quantity',
                        inputType: TextInputType.number,
                      ),
                    ],
                  ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Select Category',
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: _category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    onChanged: (String? newVal) {
                      setState(() {
                        _category = newVal!;
                        _subCategory = categoryAndSubCategories[_category]!
                            .keys
                            .toList()[0];
                        _subSubCategory = categoryAndSubCategories[_category]![
                            _subCategory]![0];
                      });
                    },
                    items: categoryAndSubCategories.keys
                        .toList()
                        .map(
                          (String item) => DropdownMenuItem(
                            value: item,
                            child: Text(item.toTitleCase()),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: _subCategory,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    onChanged: (String? newVal) {
                      setState(() {
                        _subCategory = newVal!;
                        _subSubCategory = categoryAndSubCategories[_category]![
                            _subCategory]![0];
                      });
                    },
                    items: categoryAndSubCategories[_category]!
                        .keys
                        .toList()
                        .map(
                          (String item) => DropdownMenuItem(
                            value: item,
                            child: Text(item.toTitleCase()),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: _subSubCategory,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    onChanged: (String? newVal) {
                      setState(() {
                        _subSubCategory = newVal!;
                      });
                    },
                    items: categoryAndSubCategories[_category]![_subCategory]!
                        .map(
                          (String item) => DropdownMenuItem(
                            value: item,
                            child: Text(item.toTitleCase()),
                          ),
                        )
                        .toList(),
                  ),
                ),
                CustomButton(
                  onTap: addProduct,
                  text: 'Add',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getImages() async {
    var result = await selectImages();
    if (result.length + images.length < 11) {
      images.addAll(result);

      if (mounted) {
        //Check to see if current widget is still mounted in the widget tree before calling set state so as to avoid memory leaks.
        setState(() {});
      }
      return;
    }
    showSnackBar(
        context, "You can only add a maximum of 10 product pictures", "info");
  }

  void addProduct() {
    showSnackBar(context, 'Product Added Successfully', "success");
    // if (_adminProductFormKey.currentState!.validate() && images.isNotEmpty) {
    //   //Because form validation does not cover our image selection, we also need to chack if selected images is not empty.
    //   try {
    //     adminServices.addNewProduct(
    //         context: context,
    //         name: _productNameController.text,
    //         description: _descriptionController.text,
    //         price: double.parse(
    //           _priceController.text.replaceAll(',', '').replaceAll(' ', ''),
    //         ),
    //         quantity: double.parse(
    //           _quantityController.text
    //               .replaceAll(',', '')
    //               .replaceAll(' ', '')
    //               .replaceAll('.', ''),
    //         ),
    //         category: category,
    //         images: images,
    //         onSuccess: () {
    //           showSnackBar(context, 'Product Added Successfully', "success");
    //           Navigator.pop(context);
    //           adminServices.getAllProducts(context: context);
    //         });
    //   } catch (e) {
    //     showSnackBar(context, e.toString(), "error");
    //   }
    // }
  }

  void deleteImage(File image) {
    if (images.isNotEmpty) {
      if (mounted) {
        setState(() {
          images.remove(image);
        });
      }
    }
  }
}
