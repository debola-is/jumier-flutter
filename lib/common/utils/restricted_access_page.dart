import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/common/widgets/custom_button.dart';
import 'package:jumier/constants.dart';
import 'package:jumier/features/auth/sign_in_screen.dart';
import 'package:jumier/global_variables.dart';

class RestrictedAccessPage extends StatelessWidget {
  final String title;
  const RestrictedAccessPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        title: title,
        context: context,
      ),
      body: Container(
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
                Icons.login,
                color: shadeOfOrange,
                size: 80,
              ),
            ),
           yBox24,
            const Text(
              'Please sign in to access this content',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            yBox24,
            const Text(
              'Sign in with your email address or create a new account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            yBox24,
            CustomButton(
              text: "sign in",
              color: Colors.amber.shade800,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  SignInScreen.routeName,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}