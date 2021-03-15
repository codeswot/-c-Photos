import 'package:flutter/material.dart';
import 'package:flutter_firebase_starter/screens/home_screen.dart';

import 'helpers/frontend/platform_checker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    currentDevice = platformCheckerforDesign(darkMode: true);
    print(
        'OS ${currentDevice.platform} Design Type ${currentDevice.designType} isDark ${currentDevice.darkMode}');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A',
      theme: (PlatformDesign().darkMode)
          ? ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                textTheme: TextTheme(
                  headline6: TextStyle(color: Colors.black),
                ),
              ),
            )
          : ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.black,
                textTheme: TextTheme(
                  headline6: TextStyle(color: Colors.white),
                ),
              ),
            ),
      home: HomeScreen(),
    );
  }
}
