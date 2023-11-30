// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/common/widgets/custom_button.dart';
import 'package:jumier/common/widgets/custom_loaders.dart';
import 'package:jumier/common/widgets/custom_scroll_behaviour.dart';
import 'package:jumier/common/widgets/custom_text_field.dart';
import 'package:jumier/features/admin/widgets/variant_field.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/models/product.dart';
import 'package:jumier/models/product_variant.dart';
import 'package:jumier/services/admin_services.dart';
import 'package:jumier/services/storage.dart';
import 'package:uuid/uuid.dart';

class AdminAddProductScreen extends StatefulWidget {
  static const String routeName = '/admin_add_product_screen';

  const AdminAddProductScreen({super.key});

  @override
  State<AdminAddProductScreen> createState() => _AdminAddProductScreenState();
}

class _AdminAddProductScreenState extends State<AdminAddProductScreen> {
  final AdminServices _adminServices = AdminServices();
  bool _adminServicesLoading = false;

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _oldPriceController = TextEditingController();

  final TextEditingController _appliedDiscountController =
      TextEditingController();
  final _adminProductFormKey = GlobalKey<FormState>();
  List<VariantField> variants = [];

  void createVariant() {
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController quantityController = TextEditingController();

    VariantField variant = VariantField(
      nameController: nameController,
      priceController: priceController,
      quantityController: quantityController,
    );
    variants.add(variant);
  }

  bool hasVariants = false;
  bool isDiscounted = false;
  bool _isExpressAvailable = false;
  String? _category;
  String? _subCategory;
  String? _subSubCategory;
  double _appliedDiscount = 0.0;
  List<File> images = [];

  // Widget function to vary the info displayed to the user in the UI about the
  // number of images they have selected to add to the product if any.
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

    _category = categoryStructure.keys.toList()[0];
    _subCategory = categoryStructure[_category]!.keys.toList()[0];
    _subSubCategory = categoryStructure[_category]![_subCategory]![0];
  }

  @override
  void dispose() {
    super.dispose();
    _productNameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _brandController.dispose();
    _quantityController.dispose();
    _appliedDiscountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomNetworkLoadingBarrier(
      isloading: _adminServicesLoading,
      child: Scaffold(
        appBar: getAppbar(title: 'Add New Product', context: context),
        body: ScrollConfiguration(
          behavior: CustomScrollBehaviour(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                    if (!hasVariants)
                      Column(
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
                                            builder: (BuildContext context) =>
                                                Image.file(
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
                                                position:
                                                    BadgePosition.topStart(),
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
                                                position:
                                                    BadgePosition.topStart(),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                        ],
                      ),
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
                          // Whenever the check box is toggled  or un toggled
                          // we want to perform the following actions
                          // - make the variants count 0 again
                          // - dispose all existing text editing controllers for variant entries when checkbox is toggled false
                          // - create three text editing controllers for the first three entry fields for a new variant when the checkbox is toggled true

                          hasVariants = value!;
                          if (hasVariants) {
                            createVariant();
                          }
                          if (!hasVariants) {
                            for (int i = 0; i < variants.length; i++) {
                              variants[i].nameController.dispose();
                              variants[i].priceController.dispose();
                              variants[i].quantityController.dispose();
                            }
                            variants = [];
                          }
                        });
                      },
                      title: const Text('Has variants? '),
                    ),

                    // If hasVariants is true, we want to show text fields to enter the name, price and quantity of the variant, else we want just one text field each for the price of the product and the quantity of the product in stock.

                    if (!hasVariants)
                      Column(
                        children: [
                          CheckboxListTile(
                            value: isDiscounted,
                            onChanged: (value) {
                              setState(() {
                                isDiscounted = value!;
                                if (isDiscounted) {
                                  _priceController.addListener(() {
                                    if (_oldPriceController.text != '' &&
                                        _priceController.text != '') {
                                      try {
                                        _appliedDiscount = (double.parse(
                                                    _oldPriceController.text) -
                                                double.parse(
                                                    _priceController.text)) /
                                            double.parse(
                                                _oldPriceController.text) *
                                            100;

                                        _appliedDiscountController.text =
                                            'Applied Discount: ${_appliedDiscount.floor().toString()}%';
                                        setState(() {});
                                      } catch (e) {
                                        showSnackBar(
                                            context,
                                            'Please input a valid price',
                                            ErrorType.error);
                                      }
                                    }
                                  });
                                }
                              });
                            },
                            title: const Text('Apply Discount?'),
                          ),
                          if (isDiscounted)
                            CustomTextField(
                              controller: _oldPriceController,
                              hintText: 'Old Price',
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
                          if (isDiscounted)
                            CustomTextField(
                              controller: _appliedDiscountController,
                              hintText: 'Applied Discount',
                              readOnly: true,
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
                      Column(
                        children: [
                          for (int i = 0; i < variants.length; i++)
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: shadeOfOrange,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Variant ${i + 1}',
                                          style: TextStyle(
                                            color: shadeOfOrange,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            variants.removeAt(i);
                                            if (mounted) {
                                              setState(() {});
                                            }
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: shadeOfOrange,
                                            size: 22,
                                          ),
                                        ),
                                      ],
                                    ),
                                    variants[i],
                                  ],
                                ),
                              ),
                            ),
                          MaterialButton(
                            onPressed: () {
                              if (variants.length < 10) {
                                createVariant();
                                if (mounted) {
                                  setState(() {});
                                }
                              } else {
                                showSnackBar(
                                    context,
                                    'Cannot add more than 10 variants for a single product',
                                    ErrorType.error);
                              }
                            },
                            shape: CircleBorder(
                              side: BorderSide(
                                color: shadeOfOrange,
                              ),
                            ),
                            child: Icon(
                              Icons.add,
                              color: shadeOfOrange,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    // TODO: Change controllers
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Select Category',
                        style: TextStyle(
                          color: shadeOfOrange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
                            _subCategory =
                                categoryStructure[_category]!.keys.toList()[0];
                            _subSubCategory =
                                categoryStructure[_category]![_subCategory]![0];
                          });
                        },
                        items: categoryStructure.keys
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
                            _subSubCategory =
                                categoryStructure[_category]![_subCategory]![0];
                          });
                        },
                        items: categoryStructure[_category]!
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
                        items: categoryStructure[_category]![_subCategory]!
                            .map(
                              (String item) => DropdownMenuItem(
                                value: item,
                                child: Text(item.toTitleCase()),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CheckboxListTile(
                        title: const Text("Is Express Available?"),
                        value: _isExpressAvailable,
                        onChanged: (value) {
                          setState(() {
                            _isExpressAvailable = value!;
                          });
                        },
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
        ),
      ),
    );
  }

  void addProduct() async {

    // TODO: Refactor this add product function such that all validation and interaction with model is done in the controller's function [@AdminServices.addProduct]
    assert(
      !(hasVariants == false && images.isEmpty),
      "Products that do not have variants must have at least one image",
    );
    assert(
      _productNameController.text.isNotEmpty &&
          _brandController.text.isNotEmpty &&
          _descriptionController.text.isNotEmpty,
      "Mandatory fields missing",
    );
    assert(
      !(hasVariants == false &&
          (_priceController.text.isEmpty || _quantityController.text.isEmpty)),
      "Price and quantity must be specified for products without any variants",
    );

    setState(() {
      _adminServicesLoading = true;
    });
    if (_adminProductFormKey.currentState!.validate()) {
      //  Because form validation does not cover our image selection, we also
      //  need to check if selected images is not empty.

      List<ProductVariant>? productVariants;
      if (variants.isNotEmpty) {
        productVariants = [];
        for (final x in variants) {
          final String variantFileStoreId = const Uuid().v4();
          String imageUrl =
              "https://firebasestorage.googleapis.com/v0/b/jumier-flutter.appspot.com/o/productImages%2Fnot_found.png?alt=media";
          if (x.image == null) {
            showSnackBar(
              context,
              "All product variants must have an image!",
              ErrorType.error,
            );
            break;
          } else {
            imageUrl = await StorageServices.uploadImageToCloudStorage(
                image: x.image!, uuid: variantFileStoreId);
            productVariants.add(
              ProductVariant(
                name: x.nameController.text,
                price: double.parse(x.priceController.text),
                image: imageUrl,
                quantity: int.parse(x.quantityController.text),
                fileStoreId: variantFileStoreId,
              ),
            );
          }
        }
      }
      Product? product;
      if (!hasVariants && images.isEmpty) {
        showSnackBar(
          context,
          "Product needs to have at least one image",
          ErrorType.error,
        );
      } else {
        try {
          final String productFileStoreId = const Uuid().v4();
          final imagesUrl = await StorageServices.uploadImagesToCloudStorage(
            images: images,
            uuid: productFileStoreId,
          );

          product = Product(
            name: _productNameController.text,
            brand: _brandController.text,
            description: _descriptionController.text,
            images: imagesUrl,
            price: _priceController.text.isEmpty
                ? null
                : double.parse(_priceController.text),
            oldPrice: _oldPriceController.text.isEmpty
                ? null
                : double.parse(_oldPriceController.text),
            sellerName: "sample Seller",
            category: _category!,
            subCategory: _subCategory!,
            subSubCategory: _subSubCategory!,
            timeStamp: DateTime.now().millisecondsSinceEpoch.toString(),
            quantity: _quantityController.text.isEmpty
                ? null
                : int.parse(_quantityController.text),
            isExpressAvailable: _isExpressAvailable,
            variants: productVariants,
            fileStoreId: productFileStoreId,
          );
          log("created product");
          await _adminServices.addProduct(
            context: context,
            product: product,
          );
        } catch (e) {
          log(e.toString());
          showSnackBar(
            context,
            "Supply necessary info for product",
            ErrorType.error,
          );
          setState(() {
            _adminServicesLoading = false;
          });
        }
      }
    } else {
      showSnackBar(
        context,
        "Supply necessary info for product",
        ErrorType.error,
      );
    }
    setState(() {
      _adminServicesLoading = false;
    });
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
      context,
      "You can only add a maximum of 10 product pictures",
      ErrorType.warning,
    );
  }

  void deleteImage(File image) {
    if (images.isNotEmpty) {
      try {
        images.remove(image);
      } catch (e) {
        showSnackBar(
          context,
          'Could not delete image. Try again',
          ErrorType.error,
        );
      }

      if (mounted) {
        setState(() {});
      }
    }
  }
}