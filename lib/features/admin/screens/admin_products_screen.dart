import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/common/widgets/custom_loaders.dart';
import 'package:jumier/common/widgets/custom_network_image.dart';
import 'package:jumier/common/widgets/custom_scroll_behaviour.dart';
import 'package:jumier/features/admin/screens/admin_add_products_screen.dart';
import 'package:jumier/features/admin/widgets/admin_single_product.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/models/product.dart';
import 'package:jumier/services/admin_services.dart';

class AdminProductsScreen extends StatefulWidget {
  static const routeName = './admin/products-screen';
  const AdminProductsScreen({super.key});

  @override
  State<AdminProductsScreen> createState() => _AdminProductsScreenState();
}

class _AdminProductsScreenState extends State<AdminProductsScreen> {
  final AdminServices _adminServices = AdminServices();
  List<Product>? products;
  bool isFABVisible = true;
  final bool _adminServicesLoading = false;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        title: 'Products',
        context: context,
      ),
      body: products == null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Loading all products, please wait..',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: shadeOfOrange,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: 15,
                  width: double.infinity,
                ),
                const CircularProgressIndicator(),
              ],
            )
          : CustomNetworkLoadingBarrier(
              isloading: _adminServicesLoading,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: RefreshIndicator(
                  displacement: 10,
                  onRefresh: getProducts,
                  child: ScrollConfiguration(
                    behavior: CustomScrollBehaviour(),
                    child: NotificationListener<UserScrollNotification>(
                      onNotification: (notification) {
                        if (notification.direction == ScrollDirection.forward) {
                          if (!isFABVisible) {
                            setState(() => isFABVisible = true);
                          }
                        } else if (notification.direction ==
                            ScrollDirection.reverse) {
                          if (isFABVisible) {
                            setState(() => isFABVisible = false);
                          }
                        }

                        return true;
                      },
                      child: GridView.builder(
                          itemCount: products!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            int reversedIndex = products!.length - 1 - index;
                            final productData = products![reversedIndex];
                            return Column(
                              children: [
                                SizedBox(
                                    height: screenWidth(context) / 3,
                                    child: AdminSingleProduct(
                                      product: productData,
                                      deleteProductCallback: () {},
                                    )),
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              productData.name,
                                              style: TextStyle(
                                                color: shadeOfOrange,
                                                fontSize: 12,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            Text(
                                              productData.description,
                                              style: const TextStyle(
                                                color: Colors.black45,
                                                fontSize: 10,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          confirmDelete(productData);
                                        },
                                        icon: Icon(
                                          Icons.delete_outline,
                                          color: shadeOfOrange,
                                          size: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          }),
                    ),
                  ),
                ),
              ),
            ),
      floatingActionButton: !isFABVisible
          ? null
          : FloatingActionButton(
              onPressed: () {
                goToAddProduct();

                // Navigator.push(
                //   context,
                //   CupertinoPageRoute(
                //     builder: (context) => const DBXTestScreen(),
                //   ),
                // );
              },
              tooltip: "Add a product",
              child: const Icon(
                Icons.add,
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void goToAddProduct() {
    Navigator.pushNamed(context, AdminAddProductScreen.routeName)
        .then((value) => getProducts());
  }

  Future<void> getProducts() async {
    performNetworkRequest(
      flag: _adminServicesLoading,
      function: () async {
        products = await _adminServices.getallProducts(context: context);
      },
    );
  }

  void performNetworkRequest({
    required bool flag,
    required Function function,
  }) async {
    setState(() {
      flag = true;
    });
    await function();

    if (mounted) {
      setState(() {
        flag = false;
      });
    }
  }

  void deleteProduct(Product product) {
    performNetworkRequest(
        flag: _adminServicesLoading,
        function: () {
          _adminServices.deleteProduct(
            context: context,
            productId: product.id!,
            onSuccess: () {
              showSnackBar(
                context,
                '${product.name} has been deleted successfully!',
                ErrorType.success,
              );
              getProducts();
            },
          );
        });
    log("demo deleted");
  }

  Future<void> confirmDelete(Product product) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(
              vertical: screenHeight(context) / 4,
              horizontal: screenWidth(context) / 6),
          icon: Icon(
            Icons.warning_outlined,
            color: shadeOfOrange,
          ),
          title: Text(
            'Confirm Deletion of Product',
            style: TextStyle(
              fontSize: 15,
              color: shadeOfOrange,
            ),
          ),
          content: Column(
            children: [
              Text(
                '"${product.name}"',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black45,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: screenHeight(context) / 7,
                width: 100,
                child: CustomNetworkImage(
                  imageSource: product.variants == null
                      ? product.images[0]
                      : product.variants![0].image,
                  height: double.maxFinite,
                  width: double.maxFinite,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'This action is NOT reversible',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                deleteProduct(product);
                Navigator.pop(context);
              },
              child: const Text(
                "Confirm",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: shadeOfOrange,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          backgroundColor: Colors.grey.shade100,
        );
      },
    );
  }
}