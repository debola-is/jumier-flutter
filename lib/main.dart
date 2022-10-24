import 'package:flutter/material.dart';
import 'package:jumier/app_theme.dart';
import 'package:jumier/general_home.dart';
import 'package:jumier/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jumier',
      theme: appTheme,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const GeneralHome(),
    );
  }
}
