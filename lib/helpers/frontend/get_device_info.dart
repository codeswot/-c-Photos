import 'dart:io';

import 'package:flutter_firebase_starter/utils/device_info.dart';

DeviceInfo getDeviceType() {
  if (Platform.isAndroid || Platform.isIOS) {
    return DeviceInfo(
      deviceType: DeviceType.Mobile,
      deviceOS: (Platform.isAndroid) ? DeviceOS.Android : DeviceOS.Ios,
    );
  } else if (Platform.isMacOS || Platform.isWindows) {
    return DeviceInfo(
      deviceType: DeviceType.Desktop,
      deviceOS: (Platform.isMacOS) ? DeviceOS.Macos : DeviceOS.Windows,
    );
  } else {
    return DeviceInfo(
      deviceType: DeviceType.Other,
      deviceOS: DeviceOS.Other,
    );
  }
}
