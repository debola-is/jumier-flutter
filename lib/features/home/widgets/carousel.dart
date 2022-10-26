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
                    builder: (context) => Image.asset(
                      e,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 0.9,
              padEnds: true,
              autoPlayCurve: Curves.easeInOutCubicEmphasized,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              onPageChanged: (newPage, pageChangeReason) {
                update(newPage);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < carouselImages.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CircleAvatar(
                    radius: selectedIndex == i ? 4 : 3.5,
                    foregroundColor:
                        selectedIndex == i ? Colors.orange : shadeOfBlack,
                  ),
                ),
            ],
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
