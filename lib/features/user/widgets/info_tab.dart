import 'package:flutter/material.dart';
import 'package:jumier/constants.dart';

class InfoTab extends StatelessWidget {
  final String description;

  const InfoTab({
    super.key,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.only(
        left: 15,
        top: 20,
        bottom: 10,
      ),
      color: backgroundGrey,
      child: Text(
        description,
        style: const TextStyle(
          color: Colors.black45,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
