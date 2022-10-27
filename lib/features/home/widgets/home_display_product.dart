import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/custom_network_image.dart';
import 'package:jumier/constants.dart';

class HomeDisplayProduct extends StatefulWidget {
  final double height;
  final double width;
  final bool? displayItemsRemaining;
  final String imageSource;
  const HomeDisplayProduct({
    super.key,
    this.height = 120,
    this.width = 160,
    this.displayItemsRemaining = false,
    required this.imageSource,
  });

  @override
  State<HomeDisplayProduct> createState() => _HomeDisplayProductState();
}

class _HomeDisplayProductState extends State<HomeDisplayProduct> {
  double? _itemsRemaining;
  double? _totalItems;
  double? _percentRemaining;

  @override
  void initState() {
    super.initState();

    _itemsRemaining = 20;
    _totalItems = 20.0;
    _percentRemaining = _itemsRemaining! / _totalItems!;
  }

  @override
  Widget build(BuildContext context) {
    _percentRemaining = _itemsRemaining! / _totalItems!;
    return Container(
      height: widget.height,
      width: widget.width,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomNetworkImage(
                    imageSource: widget.imageSource,
                    width: widget.width - 40,
                    height: widget.height,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  height: 25,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    '-38%',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Product Name',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
            ),
            maxLines: 1,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            '₦ 150,000',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          if (widget.displayItemsRemaining!)
            Column(
              children: [
                Container(
                  height: 10,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        _changeColor(_percentRemaining),
                        Colors.grey.shade300
                      ],
                      stops: [_percentRemaining!, 0],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: _updateItemsRemaining,
                  child: const Text('Click me'),
                ),
              ],
            ),
        ],
      ),
    );
  }

  void _updateItemsRemaining() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (timer) {
      _itemsRemaining = _itemsRemaining! - 1;
      if (_itemsRemaining! < 1) {
        timer.cancel();
        return;
      }
      setState(() {});
    });
  }

  Color _changeColor(value) {
    if (value > 0.2) {
      return Colors.orange.shade300;
    } else {
      return shadeOfRed;
    }
  }
}
