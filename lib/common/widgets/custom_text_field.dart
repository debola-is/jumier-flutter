import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? initialText;
  final int maxLines;
  final TextInputType? inputType;
  final bool obscureText;
  final bool? readOnly;
  final bool? shouldBeElevated;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? inErrorState;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.initialText,
    this.maxLines = 1,
    this.obscureText = false,
    this.inputType,
    this.readOnly,
    this.shouldBeElevated = false,
    this.prefixIcon,
    this.suffixIcon,
    this.inErrorState = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  double _elevation = 0;

  /// Focus node is used to listen to focus change in text form fields
  /// Used by adding a listener to the focus node suitably in init State
  /// focus node provides hasFocus property that can be used to control app state

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(
      () {
        if (_focusNode.hasFocus) {
          setState(() {
            _elevation = 10;
          });
        } else {
          setState(() {
            _elevation = 0;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //We would be using a text form field widget so as to
    // be able to perform certain input validation.

    return Material(
      // Material is used to wrap textFormField to provide access to property like elevation.

      elevation: widget.shouldBeElevated! ? _elevation : 0,
      borderRadius: BorderRadius.circular(15),

      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        keyboardType: widget.inputType,
        initialValue: widget.initialText,
        obscureText: widget.obscureText,
        readOnly: widget.readOnly == null ? false : widget.readOnly!,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.black26,
            fontStyle: FontStyle.italic,
          ),
          border: InputBorder.none,
          errorStyle: const TextStyle(
            height: 1,
            fontStyle: FontStyle.italic,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black12,
            ),
          ),
        ),
        maxLines: widget.maxLines,
      ),
    );
  }
}
