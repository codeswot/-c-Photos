import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_starter/helpers/frontend/platform_checker.dart';
import 'package:flutter_firebase_starter/layouts/large/screens/large_screen_home.dart';
import 'package:flutter_firebase_starter/responsive_builder/responsive_builder.dart';
import 'package:flutter_firebase_starter/widgets/capp_bar.dart';

class MediumScreenHome extends StatelessWidget {
  final dynamic data;

  const MediumScreenHome({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Scaffold(
          backgroundColor:
              (currentDevice.darkMode) ? Colors.black : Colors.white,
          appBar: PreferredSize(
            child: buildMediumAppBar(
              leading: '[C]Photos',
              trailing: [
                CupertinoAppBarButton(
                  iconData: CupertinoIcons.search,
                  onTap: () {},
                ),
                SizedBox(width: 10),
                CupertinoAppBarButton(
                  iconData: CupertinoIcons.question,
                  onTap: () {},
                ),
                SizedBox(width: 10),
                CupertinoAppBarButton(
                  iconData: CupertinoIcons.settings,
                  onTap: () {},
                ),
                SizedBox(width: 10),
                CircleAvatar(child: Text('Z')),
              ],
            ),
            preferredSize: Size.fromHeight(90),
          ),
          body: Row(
            children: [
              buildMediumSideNav(selectedIndex: 0),
              VerticalDivider(
                thickness: 0.6,
                width: 0.6,
                color: (currentDevice.darkMode) ? Colors.white : Colors.black,
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(5),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: sizingInfo.screenSize.aspectRatio,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                  ),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      child: Image.asset(data[index].photos),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    );
                  },
                ),
              ),
            ],
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

Widget buildMediumSideNav({int selectedIndex, Function(int) onSelectedIndex}) {
  if (currentDevice.designType == "Material") {
    return NavigationRail(
      extended: false,
      selectedIndex: selectedIndex,
      onDestinationSelected: onSelectedIndex,
      labelType: NavigationRailLabelType.selected,
      destinations: [
        NavigationRailDestination(
          icon: Flexible(child: Icon(Icons.photo_outlined, size: 18)),
          selectedIcon: Flexible(child: Icon(Icons.photo, size: 18)),
          label: Text('Photos'),
        ),
        NavigationRailDestination(
          icon: Flexible(child: Icon(Icons.favorite_outline, size: 18)),
          selectedIcon: Flexible(child: Icon(Icons.favorite, size: 18)),
          label: Text('Favorite'),
        ),
        NavigationRailDestination(
          icon: Flexible(child: Icon(Icons.delete_outline, size: 18)),
          selectedIcon: Flexible(child: Icon(Icons.delete, size: 18)),
          label: Text('Bin'),
        ),
        NavigationRailDestination(
          icon: Flexible(child: Icon(Icons.cloud_outlined, size: 18)),
          selectedIcon: Flexible(child: Icon(Icons.cloud, size: 18)),
          label: Text('Bin'),
        ),
      ],
    );
  } else if (currentDevice.designType == "Metro") {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(
          color: Colors.grey.withOpacity(0.3),
          child: NavigationRail(
            backgroundColor: Colors.transparent,
            extended: false,
            selectedIndex: selectedIndex,
            onDestinationSelected: onSelectedIndex,
            labelType: NavigationRailLabelType.selected,
            destinations: [
              NavigationRailDestination(
                icon: Flexible(child: Icon(Icons.photo_outlined, size: 18)),
                selectedIcon: Flexible(child: Icon(Icons.photo, size: 18)),
                label: Text('Photos'),
              ),
              NavigationRailDestination(
                icon: Flexible(child: Icon(Icons.favorite_outline, size: 18)),
                selectedIcon: Flexible(child: Icon(Icons.favorite, size: 18)),
                label: Text('Favorite'),
              ),
              NavigationRailDestination(
                icon: Flexible(child: Icon(Icons.delete_outline, size: 18)),
                selectedIcon: Flexible(child: Icon(Icons.delete, size: 18)),
                label: Text('Bin'),
              ),
              NavigationRailDestination(
                icon: Flexible(child: Icon(Icons.cloud_outlined, size: 18)),
                selectedIcon: Flexible(child: Icon(Icons.cloud, size: 18)),
                label: Text('Bin'),
              ),
            ],
          ),
        ),
      ),
    );
  } else if (currentDevice.designType == "Cupertino") {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(
          color: Colors.grey.withOpacity(0.3),
          child: NavigationRail(
            backgroundColor: Colors.transparent,
            extended: false,
            selectedIndex: selectedIndex,
            onDestinationSelected: onSelectedIndex,
            labelType: NavigationRailLabelType.selected,
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
            destinations: [
              NavigationRailDestination(
                icon: Flexible(
                  child: Icon(CupertinoIcons.photo, size: 18),
                ),
                selectedIcon: Flexible(
                  child: Icon(CupertinoIcons.photo_fill, size: 18),
                ),
                label: Text('Photos'),
              ),
              NavigationRailDestination(
                icon: Flexible(child: Icon(CupertinoIcons.bookmark, size: 18)),
                selectedIcon: Flexible(
                    child: Icon(CupertinoIcons.bookmark_solid, size: 18)),
                label: Text('Favorite'),
              ),
              NavigationRailDestination(
                icon: Flexible(child: Icon(CupertinoIcons.delete, size: 18)),
                selectedIcon: Flexible(
                    child: Icon(CupertinoIcons.delete_solid, size: 18)),
                label: Text('Bin'),
              ),
              NavigationRailDestination(
                icon: Flexible(child: Icon(CupertinoIcons.cloud, size: 18)),
                selectedIcon:
                    Flexible(child: Icon(CupertinoIcons.cloud_fill, size: 18)),
                label: Text('Bin'),
              ),
            ],
          ),
        ),
      ),
    );
  } else {
    return NavigationRail(
      extended: false,
      selectedIndex: selectedIndex,
      onDestinationSelected: onSelectedIndex,
      labelType: NavigationRailLabelType.selected,
      destinations: [
        NavigationRailDestination(
          icon: Flexible(child: Icon(Icons.photo_outlined, size: 18)),
          selectedIcon: Flexible(child: Icon(Icons.photo, size: 18)),
          label: Text('Photos'),
        ),
        NavigationRailDestination(
          icon: Flexible(child: Icon(Icons.favorite_outline, size: 18)),
          selectedIcon: Flexible(child: Icon(Icons.favorite, size: 18)),
          label: Text('Favorite'),
        ),
        NavigationRailDestination(
          icon: Flexible(child: Icon(Icons.delete_outline, size: 18)),
          selectedIcon: Flexible(child: Icon(Icons.delete, size: 18)),
          label: Text('Bin'),
        ),
        NavigationRailDestination(
          icon: Flexible(child: Icon(Icons.cloud_outlined, size: 18)),
          selectedIcon: Flexible(child: Icon(Icons.cloud, size: 18)),
          label: Text('Bin'),
        ),
      ],
    );
  }
}

Widget buildMediumAppBar({String leading, Widget body, List<Widget> trailing}) {
  if (currentDevice.designType == "Material") {
    return CAppBar(
      leading: Text('[C]Photos'),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color(0xff5f6368).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search,
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
              color: Color(0xff4f7ee1),
            ),
          ),
          SizedBox(width: 15),
          CircleAvatar(
            child: Text('Z'),
          ),
        ],
      ),
    );
  } else if (currentDevice.designType == "Cupertino") {
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
  } else if (currentDevice.designType == "Metro") {
    return CAppBar(
      leading: Text('[C]Photos'),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color(0xff5f6368).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search,
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
              color: Color(0xff4f7ee1),
            ),
          ),
          SizedBox(width: 15),
          CircleAvatar(
            child: Text('Z'),
          ),
        ],
      ),
    );
  } else {
    return CAppBar(
      leading: Text('[C]Photos'),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color(0xff5f6368).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search,
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
              color: Color(0xff4f7ee1),
            ),
          ),
          SizedBox(width: 15),
          CircleAvatar(
            child: Text('Z'),
          ),
        ],
      ),
    );
  }
}
