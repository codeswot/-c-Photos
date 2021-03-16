import 'package:flutter/material.dart';
import 'package:flutter_firebase_starter/helpers/frontend/platform_checker.dart';

class CAppBar extends StatelessWidget {
  const CAppBar({
    Key key,
    this.leading,
    this.body,
    this.trailing,
    this.appBarStyle,
  }) : super(key: key);
  final Widget leading;
  final Widget body;
  final Widget trailing;
  final BoxDecoration appBarStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: appBarStyle ?? BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (leading ?? Container()),
            (body ?? Container()),
            (trailing ?? Container()),
          ],
        ),
      ),
    );
  }
}
