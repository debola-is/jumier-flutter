import 'package:flutter/material.dart';
import 'package:jumier/constants.dart';

class CartItemButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final bool enabled;
  const CartItemButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: enabled ? shadeOfOrange : shadeOfOrange.withOpacity(0.3),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 26,
        ),
      ),
    );
  }
}
