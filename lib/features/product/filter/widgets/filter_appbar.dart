import 'package:flutter/material.dart';

class FilterAppBar extends StatelessWidget {
  final Widget? trailing;
  final String title;
  final VoidCallback? trailingOnTap;
  const FilterAppBar({
    Key? key,
    required this.title,
    this.trailing,
    this.trailingOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.close,
          size: 24,
          color: Colors.black,
        ),
      ),
      titleSpacing: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          trailing == null
              ? const SizedBox()
              : GestureDetector(
                  onTap: trailingOnTap ?? () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: trailing,
                  ),
                ),
        ],
      ),
    );
  }
}
