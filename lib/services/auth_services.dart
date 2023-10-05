import 'dart:convert';
import 'dart:developer' show log;
import 'package:jumier/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../config.dart';

class AuthService {
  // TODO: Improve password validation using regex
  // TODO: At main application initialization, perform sharedpreferences token validation. If token was generated more than a week ago, sign user out (in the background) and prompt them to sign in again via a dismissable dialogue box because token generated expires after 7days in the server side. This functinality can be taken further in other ways.
  //Validate password by checking length of characters
  bool validPassword({
    required String password,
  }) {
    if (password.length > 7 && password.length < 16) {
      return true;
    }
    return false;
  }

  Future<void> signUp({
    required BuildContext context,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    String? middleName,
  }) async {
    User user = User(
      firstName: firstName,
      middleName: middleName ?? '',
      lastName: lastName,
      phoneNumber: '',
      email: email,
      password: password,
      addresses: [],
      token: '',
      id: '',
      userType: '',
      cart: [],
      recentlyViewed: [],
      savedItems: [],
      searchHistory: '',
      defaultAddress: 0,
    );

    if (validPassword(password: password)) {
      try {
        http.Response response = await http.post(
          Uri.parse('$serverUrl/api/v0/auth/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );

        httpErrorHandler(
            response: response,
            context: context,
            onSuccess: () {
              showSnackBar(
                context,
                'Successful!',
                ErrorType.success,
              );
            });
      } catch (e) {
        log(e.toString());

        showSnackBar(
          context,
          'Error occured, could not sign user up',
          ErrorType.error,
        );
      }
    } else {
      showSnackBar(context, "Password is too weak", ErrorType.error);
    }
  }

  Future<void> signIn({
    required BuildContext context,
    required String email,
    required String password,
    String? middleName,
  }) async {
    final params = {"email": email, "password": password};

    try {
      http.Response response = await http.post(
        Uri.parse('$serverUrl/api/v0/auth/signin'),
        body: jsonEncode(params),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandler(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(
              context,
              'Sign-in success',
              ErrorType.success,
            );
            Navigator.pop(context);
            Provider.of<UserProvider>(context, listen: false)
                .setUser(response.body);
            log(Provider.of<UserProvider>(context, listen: false)
                .user
                .userType);
          });
    } catch (e) {
      log(e.toString());
      showSnackBar(
        context,
        'Sign-in failed, try another time',
        ErrorType.error,
      );
    }
  }
}
