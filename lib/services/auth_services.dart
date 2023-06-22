import 'package:flutter/cupertino.dart';
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' show log;

class AuthService {
  // TODO: Improve password validation using regex
  //Validate password by checking length of characters
  bool validPassword({
    required String password,
  }) {
    if (password.length > 7 && password.length < 16) {
      return true;
    }
    return false;
  }

  Future<bool> signUp({
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
      addresses: [],
      token: '',
      id: '',
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
                'Account created successfully, login with the same credentials',
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
    }
    return true;
  }
}
