import 'package:flutter/material.dart';

enum DeviceScreenSize { Small, Medium, Large }
enum DeviceType { Mobile, Tablet, Other, Desktop }

class DeviceScreenInfo {
  final Orientation orientation;
  final DeviceScreenSize deviceScreenSize;
  final Size screenSize;
  final Size localWidgetSize;

  DeviceScreenInfo(
      {this.orientation,
      this.deviceScreenSize,
      this.screenSize,
      this.localWidgetSize});
}

class DeviceInfo {
  final DeviceType deviceType;
  final String platform;

  DeviceInfo({this.deviceType, this.platform});
}
