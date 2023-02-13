import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/common/widgets/custom_button.dart';
import 'package:jumier/common/widgets/custom_network_image.dart';
import 'package:jumier/constants.dart';

class RateProductScreen extends StatefulWidget {
  static const routeName = './user/account/reviews/rate-product';
  const RateProductScreen({super.key});

  @override
  State<RateProductScreen> createState() => _RateProductScreenState();
}

class _RateProductScreenState extends State<RateProductScreen> {
  double productRating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        title: 'Pending Reviews',
        context: context,
        showCart: true,
        showSearch: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'How would you rate this product?'.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 100.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomNetworkImage(
                        imageSource:
                            "https://ng.jumia.is/cms/0-1-christmas-sale/2022/thumbnails/portable-power_220x220.png",
                        height: 100.0,
                        width: 100.0),
                    const SizedBox(
                      width: 5.0,
                    ),
                    SizedBox(
                      width: screenWidth(context) - 145,
                      child: const Text(
                        "This is the name of the item to be rated",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: backgroundGrey,
                thickness: 1.5,
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Tap the stars to choose',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              RatingBar.builder(
                itemPadding: const EdgeInsets.all(5.0),
                itemSize: 35,
                unratedColor: Colors.grey.shade300,
                itemBuilder: (context, index) => Icon(
                  Icons.star_rounded,
                  color: shadeOfOrange,
                ),
                onRatingUpdate: (value) => setState(() {
                  productRating = value;
                }),
              ),
              if (productRating > 0.0)
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 10, bottom: 35),
                        child: const Text(
                          'What did you like about this product?',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'How can we make it perfect?'.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      const TextField(
                        decoration: InputDecoration(hintText: 'Review Title'),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Write a Review',
                        style: TextStyle(
                            color: Colors.grey.shade400, fontSize: 12.0),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            hintText: 'How can we make it perfect?'),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Your Name',
                        style: TextStyle(
                            color: Colors.grey.shade400, fontSize: 12.0),
                      ),
                      const TextField(
                        decoration: InputDecoration(hintText: 'User Name'),
                      ),
                      const SizedBox(height: 60),
                      CustomButton(text: 'submit review', onTap: () {})
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
