import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/global_variables.dart';

class ProductDescriptionScreen extends StatelessWidget {
  final String description;
  final String keyFeatures;
  final String specifications;
  const ProductDescriptionScreen({
    super.key,
    required this.description,
    required this.keyFeatures,
    required this.specifications,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        title: 'Product Details',
        context: context,
        showCart: true,
        showHomeNavigator: true,
        showSearch: true,
      ),
      backgroundColor: shadeOfGrey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset.fromDirection(pi / 2, 5),
                ),
              ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(
                      height: 1.5,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            //   padding: const EdgeInsets.all(15.0),
            //   color: Colors.white,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const Text(
            //         'Key Features',
            //         style: TextStyle(
            //           fontWeight: FontWeight.w500,
            //           fontSize: 16.0,
            //         ),
            //       ),
            //       const SizedBox(height: 10),
            //       Text(
            //         description,
            //         style: const TextStyle(
            //           height: 1.5,
            //           fontSize: 14.0,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   width: double.infinity,
            //   margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            //   padding: const EdgeInsets.all(15.0),
            //   color: Colors.white,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const Text(
            //         'Specifications',
            //         style: TextStyle(
            //           fontWeight: FontWeight.w500,
            //           fontSize: 16.0,
            //         ),
            //       ),
            //       const SizedBox(height: 10),
            //       Text(
            //         description,
            //         style: const TextStyle(
            //           height: 1.5,
            //           fontSize: 14.0,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
