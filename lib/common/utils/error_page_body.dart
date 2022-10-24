import 'package:flutter/material.dart';
import 'package:jumier/constants.dart';

class ErrorPageBody extends StatelessWidget {
  const ErrorPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundGrey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child: Icon(
              Icons.wifi_off_outlined,
              color: shadeOfOrange,
              size: 80,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Oops! You\'re currently offline',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'To get the best shopping experience on Jumier, you\'ll need internet connection.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 1,
                    blurRadius: 2,
                  )
                ],
                color: shadeOfOrange,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                'Try Again',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
