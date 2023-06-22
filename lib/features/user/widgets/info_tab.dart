import 'package:flutter/material.dart';
import 'package:jumier/global_variables.dart';

class InfoTab extends StatelessWidget {
  final String description;
  final EdgeInsets? padding;

  const InfoTab({
    super.key,
    required this.description,
    this.padding = const EdgeInsets.only(
      left: 15,
      top: 20,
      bottom: 10,
    ),
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: padding,
      color: backgroundGrey,
      child: Text(
        description.toUpperCase(),
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
