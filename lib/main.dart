import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jumier/app_theme.dart';
import 'package:jumier/firebase_options.dart';
import 'package:jumier/general_home.dart';
import 'package:jumier/providers/user_provider.dart';
import 'package:jumier/router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
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
      home: const GeneralHome(
        pageToDisplayOnNavigate: 0,
      ),
    );
  }
}
