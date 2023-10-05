import 'dart:convert';
import 'dart:developer' show log;

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/config.dart';
import 'package:jumier/models/product.dart';
import 'package:jumier/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AdminServices {
  Future<void> addProduct({
    required BuildContext context,
    required Product product,
  }) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      http.Response response = await http.post(
        Uri.parse('$serverUrl/api/v0/admin/add-product'),
        body: product.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'user-auth-token': user.token,
        },
      );
      log(product.toJson());
      httpErrorHandler(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(
              context,
              'Product added successfully!',
              ErrorType.success,
            );
            Navigator.pop(context);
          });
    } catch (e) {
      log(e.toString());

      showSnackBar(
        context,
        'Error occured, could not add product: ${e.toString()}',
        ErrorType.error,
      );
    }
  }

  Future<List<Product>> getallProducts({
    required BuildContext context,
  }) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    List<Product> allProducts = [];
    try {
      http.Response response = await http.get(
        Uri.parse('$serverUrl/api/v0/admin/get-all-products'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'user-auth-token': user.token,
        },
      );
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

    return allProducts;
  }

  Future<void> deleteProduct({
    required BuildContext context,
    required String productId,
    required VoidCallback onSuccess,
  }) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      http.Response response = await http.delete(
        Uri.parse('$serverUrl/api/v0/admin/delete-product/$productId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'user-auth-token': user.token,
        },
      );
      httpErrorHandler(
        response: response,
        context: context,
        onSuccess: onSuccess,
      );
    } catch (e) {
      log(e.toString());

      showSnackBar(
        context,
        'Error occured while fetching products: ${e.toString()}',
        ErrorType.error,
      );
    }
  }
}
