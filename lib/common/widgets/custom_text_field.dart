import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? initialText;
  final int maxLines;
  final TextInputType? inputType;
  final bool obscureText;
  final bool? readOnly;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.initialText,
    this.maxLines = 1,
    this.obscureText = false,
    this.inputType,
    this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //We would be using a text form field widget so as to
    // be able to perform certain input validation.
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      initialValue: initialText,
      obscureText: obscureText,
      readOnly: readOnly == null ? false : readOnly!,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
