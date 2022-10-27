import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jumier/constants.dart';

class CarouselImages extends StatefulWidget {
  const CarouselImages({super.key});

  @override
  State<CarouselImages> createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  int selectedIndex = 0;
  double selectedSize = 3.5;
  double unselectedSize = 2.5;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          CarouselSlider(
            items: carouselImages
                .map(
                  (e) => Builder(
                    builder: (context) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage(e),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.4,
              viewportFraction: 0.8,
              padEnds: true,
              autoPlayCurve: Curves.easeInOutCubicEmphasized,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              onPageChanged: (newPage, pageChangeReason) {
                update(newPage);
              },
            ),
          ),
          SizedBox(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < carouselImages.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 1,
                    ),
                    child: CircleAvatar(
                      radius:
                          selectedIndex == i ? selectedSize : unselectedSize,
                      backgroundColor: selectedIndex == i
                          ? Colors.orange
                          : Colors.grey.shade400,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void update(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
