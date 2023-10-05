import 'package:flutter/cupertino.dart';
import 'package:jumier/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    firstName: '',
    middleName: '',
    lastName: '',
    phoneNumber: '',
    email: '',
    password: '',
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

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }

  void resetUser() {
    _user = User(
      firstName: '',
      middleName: '',
      lastName: '',
      phoneNumber: '',
      email: '',
      password: '',
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
  }
}
