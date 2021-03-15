import 'package:flutter/material.dart';

enum DeviceScreenSize { Small, Medium, Large }
enum DeviceType { Mobile, Tablet, Other, Desktop }
enum DeviceOS { Macos, Ios, Android, Windows, Other }

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
  final DeviceOS deviceOS;
  final String platform;

  DeviceInfo({
    this.deviceType,
    this.platform,
    this.deviceOS,
  });
}
