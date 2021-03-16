import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_starter/helpers/frontend/platform_checker.dart';
import 'package:flutter_firebase_starter/layouts/large/screens/large_screen_home.dart';
import 'package:flutter_firebase_starter/responsive_builder/responsive_builder.dart';
import 'package:flutter_firebase_starter/widgets/capp_bar.dart';

class SmallScreenHome extends StatelessWidget {
  final dynamic data;

  const SmallScreenHome({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Scaffold(
          backgroundColor:
              (currentDevice.darkMode) ? Colors.black : Colors.white,
          drawer: Drawer(),
          appBar: PreferredSize(
            child: buildSmallAppBar(
              leading: CupertinoAppBarButton(
                iconData: CupertinoIcons.bars,
                size: (currentDevice.platform == "Ios") ? 14 : 11,
              ),
              body: '[C]Photos',
              trailing: [
                CupertinoAppBarButton(
                  iconData: CupertinoIcons.search,
                  size: (currentDevice.platform == "Ios") ? 14 : 11,
                ),
                SizedBox(width: 5),
                CupertinoAppBarButton(
                  iconData: CupertinoIcons.question,
                  size: (currentDevice.platform == "Ios") ? 14 : 11,
                ),
                SizedBox(width: 5),
                CupertinoAppBarButton(
                  iconData: CupertinoIcons.settings,
                  size: (currentDevice.platform == "Ios") ? 14 : 11,
                ),
                SizedBox(width: 5),
                CircleAvatar(
                  child: Text('Z'),
                ),
              ],
            ),
            preferredSize: Size.fromHeight(60),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 1),
                child: Image.asset(
                  data[index].photos,
                ),
              );
            },
            itemCount: data.length,
          ),
          floatingActionButton: (currentDevice.designType == 'Cupertino')
              ? InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 24),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (currentDevice.darkMode)
                              ? Color(0xff686868).withOpacity(0.5)
                              : Color(0xff989A9B).withOpacity(0.5),
                        ),
                        // width: 150,
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          CupertinoIcons.add,
                          size: 20,
                          color: (currentDevice.darkMode)
                              ? Color(0xffF6F6F6)
                              : Color(0xff565656),
                        ),
                      ),
                    ),
                  ),
                )
              : FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.add),
                  isExtended: true,
                ),
        );
      },
    );
  }
}

Widget buildSmallAppBar({Widget leading, String body, List<Widget> trailing}) {
  if (currentDevice.designType == "Material") {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Color(0xff5f6368),
      ),
      title: Text(
        '[C]Photos',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xff5f6368).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.search,
            size: 20,
            color: Color(0xff5f6368),
          ),
        ),
        SizedBox(width: 15),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xff7600c2).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.help_outline_rounded,
            size: 20,
            color: Color(0xff7600c2),
          ),
        ),
        SizedBox(width: 15),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xff4f7ee1).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.settings,
            size: 20,
            color: Color(0xff4f7ee1),
          ),
        ),
        SizedBox(width: 15),
        CircleAvatar(
          radius: 18,
          child: Text('Z'),
        ),
        SizedBox(width: 15),
      ],
    );
  } else if (currentDevice.designType == "Cupertino") {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(
          child: CAppBar(
            appBarStyle: BoxDecoration(
              color: (currentDevice.darkMode)
                  ? Colors.white.withOpacity(0.2)
                  : Colors.black.withOpacity(0.2),
              border: Border(
                bottom: BorderSide(
                  color: (currentDevice.darkMode) ? Colors.white : Colors.black,
                  width: 0.6,
                ),
              ),
            ),
            leading: leading ?? Container(),
            body: Text(
              body ?? 'Cupertino',
              style: TextStyle(
                color:
                    (currentDevice.darkMode) ? Colors.white : Color(0xff4E4F4F),
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            trailing: Row(
              children: trailing ?? Container(),
            ),
          ),
        ),
      ),
    );
  } else if (currentDevice.designType == "Metro") {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Color(0xff5f6368),
      ),
      title: Text(
        '[C]Photos',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xff5f6368).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.search,
            size: 20,
            color: Color(0xff5f6368),
          ),
        ),
        SizedBox(width: 15),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xff7600c2).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.help_outline_rounded,
            size: 20,
            color: Color(0xff7600c2),
          ),
        ),
        SizedBox(width: 15),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xff4f7ee1).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.settings,
            size: 20,
            color: Color(0xff4f7ee1),
          ),
        ),
        SizedBox(width: 15),
        CircleAvatar(
          radius: 18,
          child: Text('Z'),
        ),
        SizedBox(width: 15),
      ],
    );
  } else {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Color(0xff5f6368),
      ),
      title: Text(
        '[C]Photos',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xff5f6368).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.search,
            size: 20,
            color: Color(0xff5f6368),
          ),
        ),
        SizedBox(width: 15),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xff7600c2).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.help_outline_rounded,
            size: 20,
            color: Color(0xff7600c2),
          ),
        ),
        SizedBox(width: 15),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xff4f7ee1).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.settings,
            size: 20,
            color: Color(0xff4f7ee1),
          ),
        ),
        SizedBox(width: 15),
        CircleAvatar(
          radius: 18,
          child: Text('Z'),
        ),
        SizedBox(width: 15),
      ],
    );
  }
}
