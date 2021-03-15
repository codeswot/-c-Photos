import 'dart:io';

import 'package:flutter_firebase_starter/utils/device_info.dart';

var currentDevice;
DeviceInfo getDeviceType() {
  if (Platform.isAndroid || Platform.isIOS) {
    return DeviceInfo(
      deviceType: DeviceType.Mobile,
      platform: Platform.operatingSystem,
    );
  } else if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
    return DeviceInfo(
      deviceType: DeviceType.Desktop,
      platform: Platform.operatingSystem,
    );
  } else {
    return DeviceInfo(
      deviceType: DeviceType.Other,
      platform: Platform.operatingSystem,
    );
  }
}
