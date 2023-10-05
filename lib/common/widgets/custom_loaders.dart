import 'package:flutter/material.dart';
import 'package:jumier/global_variables.dart';

class CustomNetworkLoadingBarrier extends StatelessWidget {
  final Widget child;
  final bool isloading;
  const CustomNetworkLoadingBarrier({
    super.key,
    required this.child,
    required this.isloading,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isloading)
          const Opacity(
            opacity: 0.7,
            child: ModalBarrier(
              dismissible: false,
              color: Colors.black,
            ),
          ),
        if (isloading)
          Center(
            child: CircularProgressIndicator(
              color: shadeOfOrange,
            ),
          ),
      ],
    );
  }
}
