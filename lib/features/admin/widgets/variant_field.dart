import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/custom_text_field.dart';

class VariantField extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController quantityController;

  const VariantField({
    super.key,
    required this.nameController,
    required this.priceController,
    required this.quantityController,
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
        ],
      ),
    );
  }
}
