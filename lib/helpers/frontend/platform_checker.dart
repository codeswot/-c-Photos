import 'package:flutter_firebase_starter/utils/device_info.dart';

import 'get_device_info.dart';

PlatformDesign currentDevice;

PlatformDesign platformCheckerforDesign({bool darkMode}) {
  var device = getDeviceType();
  if (device.deviceOS == DeviceOS.Ios) {
    return PlatformDesign(
      platform: 'Ios',
      designType: 'Cupertino',
      darkMode: darkMode,
    );
  } else if (device.deviceOS == DeviceOS.Macos) {
    return PlatformDesign(
      platform: 'Macos',
      designType: 'Cupertino',
      darkMode: darkMode,
    );
  } else if (device.deviceOS == DeviceOS.Android) {
    return PlatformDesign(
      platform: 'Android',
      designType: 'Material',
      darkMode: darkMode,
    );
  } else if (device.deviceOS == DeviceOS.Windows) {
    return PlatformDesign(
      platform: 'Windows',
      designType: 'Metro',
      darkMode: darkMode,
    );
  } else {
    return PlatformDesign(
      platform: 'others',
      designType: 'Custom',
      darkMode: darkMode,
    );
  }
}

class PlatformDesign {
  final String platform;
  final String designType;
  final bool darkMode;

  PlatformDesign({
    this.platform,
    this.designType,
    this.darkMode = false,
  });
}
