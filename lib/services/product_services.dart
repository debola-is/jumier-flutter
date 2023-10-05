import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/config.dart';
import 'package:jumier/features/product/filter/filter_screen.dart';
import 'package:jumier/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' show log;

class ProductServices {
  Future<List<Product>> getProducts({
    required BuildContext context,
    required String category,
    required String subCategory,
    required String subSubCategory,
  }) async {
    List<Product> allProducts = [];
    try {
      category = category.replaceAll('&', '%26');
      subCategory = subCategory.replaceAll('&', '%26');
      subSubCategory = subSubCategory.replaceAll('&', '%26');
      http.Response response = await http.get(
        Uri.parse(
            '$serverUrl/api/v0/products/get/?c=$category&sc=$subCategory&ssc=$subSubCategory'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      log('$serverUrl/api/v0/products/get?c=$category&sc=$subCategory&ssc=$subSubCategory');
      httpErrorHandler(
          response: response,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(response.body).length; i++) {
              final product = Product.fromMap(jsonDecode(response.body)[i]);
              allProducts.add(product);
            }
          });
    } catch (e) {
      log(e.toString());

      showSnackBar(
        context,
        'Error occured while fetching products: ${e.toString()}',
        ErrorType.error,
      );
    }
    if (allProducts.isEmpty) {
      log("empty");
    } else {
      log("not empty");
    }

    return allProducts;
  }

  static double calculateRatingsScore(Product product) {
    if (product.ratings!.isEmpty) {
      return 0;
    }
    double totalScore = 0;
    for (final rating in product.ratings!) {
      totalScore += rating.rating;
    }
    double average = totalScore / product.ratings!.length;
    return average;
  }
}
