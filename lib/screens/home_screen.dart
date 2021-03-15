import 'package:flutter/material.dart';
import 'package:flutter_firebase_starter/layouts/large/screens/large_screen_home.dart';
import 'package:flutter_firebase_starter/layouts/medium/screens/medium_screen_home.dart';
import 'package:flutter_firebase_starter/layouts/small/screens/small_screen_home.dart';
import 'package:flutter_firebase_starter/responsive_builder/responsive_builder.dart';
import 'package:flutter_firebase_starter/utils/device_info.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInfo) {
      if (sizingInfo.deviceScreenSize == DeviceScreenSize.Large) {
        return LargeScreenHome();
      } else if (sizingInfo.deviceScreenSize == DeviceScreenSize.Medium) {
        return MediumScreenHome();
      } else if (sizingInfo.deviceScreenSize == DeviceScreenSize.Small) {
        return SmallScreenHome();
      } else {
        return SmallScreenHome();
      }
    });
  }
}
