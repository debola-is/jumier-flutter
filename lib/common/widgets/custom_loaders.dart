import 'package:flutter/material.dart';

class NetworkLoadingAnimation extends StatefulWidget {
  const NetworkLoadingAnimation({Key? key}) : super(key: key);

  @override
  State<NetworkLoadingAnimation> createState() =>
      _NetworkLoadingAnimationState();
}

class _NetworkLoadingAnimationState extends State<NetworkLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(
      seconds: 2,
    ),
  )..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.rotate(
            angle: _animationController.value * 2 * 3.14,
            child: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset('assets/images/star.png')),
          );
        });
  }
}

class ImageLoadingAnimation extends StatelessWidget {
  final double? height;
  final double? width;

  const ImageLoadingAnimation({
    Key? key,
    this.height = 100,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? height,
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}
