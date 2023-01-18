import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/common/widgets/custom_loaders.dart';
import 'package:jumier/common/widgets/custom_scroll_behaviour.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/features/product/screens/see_all_products_screen.dart';
import 'package:jumier/features/product/widgets/category_single_product.dart';
import 'package:jumier/models/product.dart';

class ProductsScreen extends StatefulWidget {
  static const routeName = './admin/products-screen';
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product>? products;
  bool isFABVisible = true;

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
        showSearch: true,
        showCart: true,
      ),
      body: products == null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Loading all products, please wait..',
                  style: TextStyle(
                    color: shadeOfOrange,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const ImageLoadingAnimation(),
              ],
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: RefreshIndicator(
                displacement: 10,
                onRefresh: getProducts,
                child: ScrollConfiguration(
                  behavior: CustomScrollBehaviour(),
                  child: NotificationListener<UserScrollNotification>(
                    onNotification: (notification) {
                      if (notification.direction == ScrollDirection.forward) {
                        if (!isFABVisible) setState(() => isFABVisible = true);
                      } else if (notification.direction ==
                          ScrollDirection.reverse) {
                        if (isFABVisible) setState(() => isFABVisible = false);
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
                                child: const CategorySingleProduct(
                                  layout: Layout.grid,
                                ),
                              ),
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
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        // confirmDelete(productData);
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        size: 15,
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
      floatingActionButton: !isFABVisible
          ? null
          : FloatingActionButton(
              onPressed: () {
                // goToAddProduct();
              },
              tooltip: "Add a product",
              child: const Icon(
                Icons.add,
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // void goToAddProduct() {
  //   Navigator.pushNamed(context, AddProductScreen.routeName);
  // }

  Future<void> getProducts() async {
    // products = await adminServices.getAllProducts(context: context);

    // if (mounted) {
    //   //Check to see if current widget is still mounted in the widget tree before calling set state so as to avoid memory leaks.
    //   setState(() {});
    // }
  }

  // void deleteProduct(Product product) {
  //   adminServices.deleteProduct(
  //     context: context,
  //     productId: product.id!,
  //     onSuccess: () {
  //       showSnackBar(context, '${product.name} has been deleted successfully!',
  //           'success');
  //       getProducts();
  //     },
  //   );
  // }

  // Future<void> confirmDelete(Product product) {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Expanded(
  //           child: AlertDialog(
  //             insetPadding: EdgeInsets.symmetric(
  //                 vertical: screenHeight(context) / 4,
  //                 horizontal: screenWidth(context) / 6),
  //             icon: Icon(
  //               Icons.warning_outlined,
  //               color: GlobalVariables.selectedNavBarColor,
  //             ),
  //             title: Text(
  //               'Confirm Deletion of Product',
  //               style: TextStyle(
  //                   fontSize: 15, color: GlobalVariables.selectedNavBarColor),
  //             ),
  //             content: Column(
  //               children: [
  //                 Text(
  //                   '"${product.name}"',
  //                   style: const TextStyle(
  //                     fontSize: 14,
  //                     color: Colors.black45,
  //                   ),
  //                   maxLines: 1,
  //                   overflow: TextOverflow.ellipsis,
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 SizedBox(
  //                   height: screenHeight(context) / 7,
  //                   width: 100,
  //                   child: CustomNetworkImage(
  //                     imageSource: product.images[0],
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 20,
  //                 ),
  //                 const Text(
  //                   'This action is NOT reversible',
  //                   style: TextStyle(
  //                     fontSize: 14,
  //                     color: Colors.black45,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             actions: [
  //               TextButton(
  //                 onPressed: () {
  //                   deleteProduct(product);
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text(
  //                   "Confirm",
  //                   style: TextStyle(
  //                     color: Colors.red,
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                 ),
  //               ),
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: Text(
  //                   "Cancel",
  //                   style: TextStyle(
  //                     color: GlobalVariables.selectedNavBarColor,
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                 ),
  //               )
  //             ],
  //             shape: const RoundedRectangleBorder(
  //               borderRadius: BorderRadius.all(
  //                 Radius.circular(20),
  //               ),
  //             ),
  //             backgroundColor: Colors.grey.shade100,
  //           ),
  //         );
  //       });
  // }
}
