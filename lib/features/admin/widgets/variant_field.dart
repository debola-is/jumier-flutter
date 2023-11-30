import 'dart:io';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/common/widgets/custom_text_field.dart';
import 'package:jumier/global_variables.dart';

class VariantField extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController quantityController;
  late File? image;

  VariantField({
    super.key,
    required this.nameController,
    required this.priceController,
    required this.quantityController,
    this.image,
  });

  @override
  State<VariantField> createState() => _VariantFieldState();
}

class _VariantFieldState extends State<VariantField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          if (widget.image == null)
            GestureDetector(
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
          if (widget.image != null)
            SizedBox(
                height: 120,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(widget.image!),
                    ),
                    GestureDetector(
                      onTap: () {
                        deleteImage();
                      },
                      child: Badge(
                        badgeColor: Colors.white,
                        position: BadgePosition.topStart(),
                        badgeContent: Icon(
                          Icons.close_sharp,
                          size: 20,
                          color: shadeOfOrange,
                        ),
                      ),
                    ),
                  ],
                )),
          CustomTextField(
            controller: widget.nameController,
            hintText: 'Variant Name',
            inputType: TextInputType.name,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: widget.priceController,
            hintText: 'Price',
            inputType: TextInputType.number,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: widget.quantityController,
            hintText: 'Quantity',
            inputType: TextInputType.number,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  void getImages() async {
    widget.image = (await selectImages(allowMultiple: false))[0];
    if (mounted) {
      //Check to see if current widget is still mounted in the widget tree before calling set state so as to avoid memory leaks.
      setState(() {});
    }
  }

  void deleteImage() {
    widget.image = null;
    if (mounted) {
      setState(() {});
    }
  }
}
