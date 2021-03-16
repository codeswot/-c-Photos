import 'package:flutter/material.dart';
import 'package:flutter_firebase_starter/helpers/frontend/get_device_screen_type.dart';
import 'package:flutter_firebase_starter/utils/device_info.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceScreenInfo screenInfo)
      builder;
  const ResponsiveBuilder({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var screenSizeInfo = DeviceScreenInfo(
            orientation: mediaQuery.orientation,
            screenSize: mediaQuery.size,
            deviceScreenSize: getDeviceSizeType(mediaQuery),
            localWidgetSize: Size(
              constraints.maxWidth,
              constraints.maxHeight,
            ));
        return builder(context, screenSizeInfo);
      },
    );
  }
}
