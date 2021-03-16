import 'package:flutter/material.dart';
import 'package:flutter_firebase_starter/helpers/backend/http_helper.dart';
import 'package:flutter_firebase_starter/helpers/backend/mock_images.dart';
import 'package:flutter_firebase_starter/layouts/large/screens/large_screen_home.dart';
import 'package:flutter_firebase_starter/layouts/medium/screens/medium_screen_home.dart';
import 'package:flutter_firebase_starter/layouts/small/screens/small_screen_home.dart';
import 'package:flutter_firebase_starter/responsive_builder/responsive_builder.dart';
import 'package:flutter_firebase_starter/utils/device_info.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic myData = mockPhotos;

    return ResponsiveBuilder(builder: (context, sizingInfo) {
      if (sizingInfo.deviceScreenSize == DeviceScreenSize.Large) {
        return LargeScreenHome(
          data: myData,
        );
      } else if (sizingInfo.deviceScreenSize == DeviceScreenSize.Medium) {
        return MediumScreenHome(
          data: myData,
        );
      } else if (sizingInfo.deviceScreenSize == DeviceScreenSize.Small) {
        return SmallScreenHome(
          data: myData,
        );
      } else {
        return SmallScreenHome(
          data: myData,
        );
      }
    });
  }
}
