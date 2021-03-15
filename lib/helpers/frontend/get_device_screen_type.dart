import 'package:flutter/material.dart';
import 'package:flutter_firebase_starter/utils/device_info.dart';

DeviceScreenSize getDeviceSizeType(MediaQueryData mediaQueryData) {
  var orientation = mediaQueryData.orientation;
  double deviceWidth = 0;

  if (orientation == Orientation.portrait) {
    deviceWidth = mediaQueryData.size.width;
    // deviceHeight = mediaQueryData.size.width;
  } else {
    deviceWidth = mediaQueryData.size.width;
    // deviceHeight = mediaQueryData.size.height;
  }
  if (deviceWidth > 950) {
    return DeviceScreenSize.Large;
  } else if (deviceWidth > 600) {
    return DeviceScreenSize.Medium;
  } else {
    return DeviceScreenSize.Small;
  }
}
