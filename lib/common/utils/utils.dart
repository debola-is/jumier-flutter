import 'package:flutter/material.dart';
import 'package:jumier/constants.dart';

Widget freeDeliveryBadge() {
  return Container(
    padding: const EdgeInsets.all(3),
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(2),
    ),
    child: const Text(
      'Free Delivery*',
      style: TextStyle(
        color: Colors.white,
        fontSize: 8,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget officialStoreBadge() {
  return Container(
    padding: const EdgeInsets.all(3),
    decoration: BoxDecoration(
      color: Colors.blue.shade800,
      borderRadius: BorderRadius.circular(2),
    ),
    child: const Text(
      'Official Store',
      style: TextStyle(
        color: Colors.white,
        fontSize: 8,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget unitsLeft(int quantity) {
  assert(quantity >= 0);
  Color color = Colors.green;
  if (quantity <= 5) {
    color = Colors.red.shade900;
  } else if (quantity <= 15) {
    color = Colors.amber.shade600;
  }
  String text = 'units';
  if (quantity <= 1) {
    text = 'unit';
  }
  return Row(
    children: [
      if (quantity <= 5)
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.error_outline,
            color: color,
            size: 14,
          ),
        ),
      Text(
        '$quantity $text remaining',
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.65,
        ),
      ),
    ],
  );
}

Widget shippingCost(double cost) {
  return Text('+ ₦$cost shipping from LEKKI-AJAH (SANGOTEDO)');
}

MaterialButton customButton({
  required String title,
  double? width,
  double? height,
  double? textSize,
}) {
  return MaterialButton(
    onPressed: () {},
    color: shadeOfOrange,
    height: height ?? 25,
    minWidth: width ?? 120,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    child: Text(
      title,
      style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontWeight: FontWeight.bold,
          fontSize: textSize ?? 12),
    ),
  );
}
