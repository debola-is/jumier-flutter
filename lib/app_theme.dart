import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  primaryColor: Colors.orange,
  primarySwatch: Colors.orange,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  iconTheme: const IconThemeData(
    color: Colors.white,
    size: 16,
  ),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 18,
    ),
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedIconTheme: IconThemeData(
      color: Colors.orange,
      size: 18,
    ),
    selectedLabelStyle: TextStyle(
      color: Colors.orange,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.black87,
      size: 18,
    ),
    unselectedLabelStyle: TextStyle(
      color: Colors.black38,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ),
);
