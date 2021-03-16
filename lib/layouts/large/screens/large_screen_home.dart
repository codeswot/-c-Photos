import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_starter/helpers/frontend/platform_checker.dart';
import 'package:flutter_firebase_starter/responsive_builder/responsive_builder.dart';
import 'package:flutter_firebase_starter/widgets/capp_bar.dart';

class LargeScreenHome extends StatelessWidget {
  final dynamic data;

  const LargeScreenHome({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Scaffold(
          backgroundColor:
              (currentDevice.darkMode) ? Colors.black : Colors.white,
          appBar: PreferredSize(
            child: buildLargeAppBar(
              leading: '[C]Photos',
              body: LargeSearchBar(),
              trailing: [
                CupertinoAppBarButton(
                  onTap: () {},
                  iconData: CupertinoIcons.question,
                ),
                SizedBox(width: 15),
                CupertinoAppBarButton(
                  onTap: () {},
                  iconData: CupertinoIcons.settings,
                ),
                SizedBox(width: 15),
                CircleAvatar(
                  child: Text('Z'),
                ),
              ],
            ),
            preferredSize: Size.fromHeight(100),
          ),
          body: Row(
            children: [
              buildLargeSideNav(selectedIndex: 0),
              VerticalDivider(
                thickness: 0.6,
                width: 0.6,
                color: (currentDevice.darkMode) ? Colors.white : Colors.black,
              ),
              Expanded(
                child: Column(
                  children: [
                    // Text('Desktop'),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.all(5),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 400,
                          childAspectRatio: sizingInfo.screenSize.aspectRatio,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3,
                        ),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              child: Image.asset(data[index].photos),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: (currentDevice.designType == 'Cupertino')
              ? InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 24),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (currentDevice.darkMode)
                              ? Color(0xff686868).withOpacity(0.5)
                              : Color(0xff989A9B).withOpacity(0.5),
                        ),
                        width: 150,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Upload',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: (currentDevice.darkMode)
                                    ? Color(0xffF6F6F6)
                                    : Color(0xff565656),
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              CupertinoIcons.add,
                              size: 20,
                              color: (currentDevice.darkMode)
                                  ? Color(0xffF6F6F6)
                                  : Color(0xff565656),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : FloatingActionButton.extended(
                  onPressed: () {},
                  label: Text('Upload'),
                  icon: Icon(Icons.add),
                  isExtended: true,
                ),
        );
      },
    );
  }
}

class CupertinoAppBarButton extends StatelessWidget {
  const CupertinoAppBarButton({
    Key key,
    this.iconData,
    this.onTap,
    this.size,
  }) : super(key: key);
  final IconData iconData;
  final Function onTap;
  final double size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: (currentDevice.platform == 'Ios')
            ? EdgeInsets.all(5)
            : EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        decoration: BoxDecoration(
          color: (currentDevice.platform == 'Ios')
              ? Colors.transparent
              : (currentDevice.darkMode)
                  ? Color(0xff686868)
                  : Color(0xffF6F6F6),

          borderRadius: (currentDevice.platform == 'Ios')
              ? null
              : BorderRadius.circular(5),
          // border: Border.all(color: Colors.white, width: 0.0),
          shape: (currentDevice.platform == 'Ios')
              ? BoxShape.circle
              : BoxShape.rectangle,
        ),
        child: Icon(
          iconData,
          size: size ?? 19,
          color:
              (currentDevice.darkMode) ? Color(0xffF6F6F6) : Color(0xff565656),
        ),
      ),
    );
  }
}

class MaterialAppBarButton extends StatelessWidget {
  const MaterialAppBarButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xff7600c2).withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.help_outline_rounded,
        color: Color(0xff7600c2),
      ),
    );
  }
}

class LargeSearchBar extends StatelessWidget {
  const LargeSearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 0.2,
            color: (currentDevice.darkMode) ? Colors.white : Colors.black,
          ),
        ),
        child: TextField(
          cursorColor: (currentDevice.darkMode) ? Colors.white : Colors.black,
          style: TextStyle(
              color: (currentDevice.darkMode) ? Colors.white : Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(13),
            prefixIcon: Icon(
              (currentDevice.designType == 'Cupertino')
                  ? CupertinoIcons.search
                  : Icons.search,
              color: (currentDevice.designType == 'Cupertino')
                  ? Color(0xff989A9B)
                  : (currentDevice.darkMode)
                      ? Color(0xff)
                      : Color(0xff),
            ),
            border: InputBorder.none,
            hintText: 'Search photos',
            hintStyle: TextStyle(
              color: (currentDevice.designType == 'Cupertino')
                  ? Color(0xff989A9B)
                  : (currentDevice.darkMode)
                      ? Color(0xff)
                      : Color(0xff),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildLargeAppBar({String leading, Widget body, List<Widget> trailing}) {
  print(currentDevice.designType);
  if (currentDevice.designType == 'Material') {
    return CAppBar(
      leading: leading ?? Text('Material'),
      body: body ?? Container(),
      trailing: trailing ?? Container(),
    );
  } else if (currentDevice.designType == 'Cupertino') {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 30,
          sigmaY: 30,
          tileMode: TileMode.decal,
        ),
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
          leading: Text(
            leading ?? 'Cupertino',
            style: TextStyle(
              color:
                  (currentDevice.darkMode) ? Colors.white : Color(0xff4E4F4F),
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          body: body ?? Container(),
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: trailing ??
                [
                  Container(),
                ],
          ),
        ),
      ),
    );
  } else if (currentDevice.designType == 'Metro') {
    return CAppBar(
      leading: leading ?? Text('Metro'),
      body: body ?? Container(),
      trailing: trailing ?? Container(),
    );
  } else {
    return CAppBar(
      leading: leading ?? Text('Other'),
      body: body ?? Container(),
      trailing: trailing ?? Container(),
    );
  }
}

Widget buildLargeSideNav({int selectedIndex, Function(int) onSelectedIndex}) {
  if (currentDevice.designType == 'Material') {
    return Container(
      color: Colors.grey.withOpacity(0.3),
      child: NavigationRail(
        backgroundColor: (currentDevice.darkMode) ? Colors.black : Colors.white,
        extended: true,
        selectedIndex: selectedIndex,
        onDestinationSelected: onSelectedIndex,
        groupAlignment: -1.0,
        destinations: [
          NavigationRailDestination(
            icon: Icon(Icons.photo_outlined),
            selectedIcon: Icon(Icons.photo),
            label: Text('Photos'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite),
            label: Text('Favourite'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.delete_outline),
            selectedIcon: Icon(Icons.delete),
            label: Text('Bin'),
          ),
          NavigationRailDestination(
            padding: EdgeInsets.only(top: 15),
            icon: Icon(Icons.cloud_outlined),
            selectedIcon: Icon(Icons.cloud),
            label: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Storage'),
                SizedBox(height: 5),
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '10% of 14.5GB',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  } else if (currentDevice.designType == 'Cupertino') {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(
          color: Colors.grey.withOpacity(0.3),
          child: NavigationRail(
            backgroundColor: Colors.transparent,
            unselectedIconTheme: IconThemeData(
              color: (currentDevice.darkMode)
                  ? Color(0xff565656)
                  : Color(0xff4E4F4F),
            ),
            unselectedLabelTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: (currentDevice.darkMode)
                  ? Color(0xff565656)
                  : Color(0xff4E4F4F),
            ),
            selectedLabelTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: (currentDevice.darkMode)
                  ? Color(0xff565656)
                  : Color(0xff4E4F4F),
            ),
            selectedIconTheme: IconThemeData(
              color: (currentDevice.darkMode)
                  ? Color(0xff565656)
                  : Color(0xff4E4F4F),
            ),
            extended: true,
            selectedIndex: selectedIndex,
            onDestinationSelected: onSelectedIndex,
            groupAlignment: -1.0,
            destinations: [
              NavigationRailDestination(
                icon: Icon(CupertinoIcons.photo),
                selectedIcon: Icon(CupertinoIcons.photo_fill),
                label: Text('Photos'),
              ),
              NavigationRailDestination(
                icon: Icon(CupertinoIcons.bookmark),
                selectedIcon: Icon(CupertinoIcons.bookmark_solid),
                label: Text('Favourite'),
              ),
              NavigationRailDestination(
                icon: Icon(CupertinoIcons.delete),
                selectedIcon: Icon(CupertinoIcons.delete_solid),
                label: Text('Bin'),
              ),
              NavigationRailDestination(
                padding: EdgeInsets.only(top: 15),
                icon: Icon(Icons.cloud_outlined),
                selectedIcon: Icon(Icons.cloud),
                label: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Storage'),
                    SizedBox(height: 5),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '10% of 14.5GB',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } else if (currentDevice.designType == 'Metro') {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(
          color: Colors.grey.withOpacity(0.3),
          child: NavigationRail(
            backgroundColor: Colors.transparent,
            extended: true,
            selectedIndex: selectedIndex,
            onDestinationSelected: onSelectedIndex,
            groupAlignment: -1.0,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.photo_outlined),
                selectedIcon: Icon(Icons.photo),
                label: Text('Photos'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite_outline),
                selectedIcon: Icon(Icons.favorite),
                label: Text('Favourite'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.delete_outline),
                selectedIcon: Icon(Icons.delete),
                label: Text('Bin'),
              ),
              NavigationRailDestination(
                padding: EdgeInsets.only(top: 15),
                icon: Icon(Icons.cloud_outlined),
                selectedIcon: Icon(Icons.cloud),
                label: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Storage'),
                    SizedBox(height: 5),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '10% of 14.5GB',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } else {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(
          color: Colors.grey.withOpacity(0.3),
          child: NavigationRail(
            backgroundColor: Colors.transparent,
            extended: true,
            selectedIndex: selectedIndex,
            onDestinationSelected: onSelectedIndex,
            groupAlignment: -1.0,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.photo_outlined),
                selectedIcon: Icon(Icons.photo),
                label: Text('Photos'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite_outline),
                selectedIcon: Icon(Icons.favorite),
                label: Text('Favourite'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.delete_outline),
                selectedIcon: Icon(Icons.delete),
                label: Text('Bin'),
              ),
              NavigationRailDestination(
                padding: EdgeInsets.only(top: 15),
                icon: Icon(Icons.cloud_outlined),
                selectedIcon: Icon(Icons.cloud),
                label: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Storage'),
                    SizedBox(height: 5),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '10% of 14.5GB',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
