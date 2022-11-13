import 'package:flutter/material.dart';

class OutOfStockBanner extends StatelessWidget {
  const OutOfStockBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 140,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Text(
        'OUT OF STOCK',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
