import 'package:flutter/material.dart';
import 'package:flutter_firebase_starter/screens/home_screen.dart';

import 'helpers/frontend/get_device_info.dart';

void main() {
  runApp(MyApp());
  currentDevice = getDeviceType();
  print(currentDevice.deviceType);
  print(currentDevice.platform);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'A',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
          ),
        ),
        home: HomeScreen());
  }
}
