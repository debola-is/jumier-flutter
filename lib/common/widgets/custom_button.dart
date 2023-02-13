import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final bool? showBorder;
  final bool? showShadows;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.textStyle,
    this.width,
    this.height,
    this.showBorder = false,
    this.showShadows = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 50,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: showBorder! ? Colors.white : shadeOfOrange,
          boxShadow: showShadows!
              ? const [
                  BoxShadow(
                      color: Colors.black26, spreadRadius: 1, blurRadius: 3)
                ]
              : null,
          borderRadius: BorderRadius.circular(5),
          border:
              showBorder! ? Border.all(color: shadeOfOrange, width: 1.5) : null,
        ),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: textStyle ??
                TextStyle(
                  color: showBorder! ? shadeOfOrange : Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
