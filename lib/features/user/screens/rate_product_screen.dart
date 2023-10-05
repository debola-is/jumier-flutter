import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/common/widgets/custom_button.dart';
import 'package:jumier/common/widgets/custom_network_image.dart';
import 'package:jumier/global_variables.dart';

class RateProductScreen extends StatefulWidget {
  static const routeName = './user/account/reviews/rate-product';
  const RateProductScreen({super.key});

  @override
  State<RateProductScreen> createState() => _RateProductScreenState();
}

class _RateProductScreenState extends State<RateProductScreen> {
  double productRating = 0.0;

// These are the interactive questions that reviewer will be asked based on their inputted rating.
  String text1 = '';
  String text2 = '';

  //This function will change the value of the text

  void updateQuestions(double rating) {
    if (rating > 3.0) {
      text1 = 'What did you like about this product?';
    } else {
      text1 = 'What did you dislike about this product?';
    }

    if (rating > 4.0) {
      text2 = 'What did you like the most about it?';
    } else if (rating > 3.0) {
      text2 = 'How can we make it perfect?';
    } else if (rating > 2.0) {
      text2 = 'Could it be better?';
    } else {
      text2 = 'How can we improve it?';
    }
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _reviewController.dispose();
    _nameController.dispose();
  }

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
                minRating: 1.0,
                unratedColor: Colors.grey.shade300,
                itemBuilder: (context, index) => Icon(
                  Icons.star_rounded,
                  color: shadeOfOrange,
                ),
                onRatingUpdate: (value) => setState(() {
                  productRating = value;
                  _nameController.text = 'User\'s name';
                  updateQuestions(value);
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
                        child: Text(
                          text1,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        text2.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextField(
                        controller: _titleController,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Review Title',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Write a Review',
                        style: TextStyle(
                            color: Colors.grey.shade400, fontSize: 12.0),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      TextField(
                        controller: _reviewController,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: text2,
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400, fontSize: 14),
                          contentPadding: const EdgeInsets.all(15.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade400, width: 2.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: shadeOfOrange, width: 2.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Your Name',
                        style: TextStyle(
                            color: Colors.grey.shade400, fontSize: 12.0),
                      ),
                      TextField(
                        controller: _nameController,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400, fontSize: 14),
                        ),
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
