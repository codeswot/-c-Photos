import 'package:flutter/material.dart';
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
          appBar: PreferredSize(
            child: CAppBar(
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
            ),
            preferredSize: Size.fromHeight(90),
          ),
          body: Row(
            children: [
              NavigationRail(
                extended: false,
                selectedIndex: 0,
                onDestinationSelected: (int index) {
                  // setState(() {
                  //   _selectedIndex = index;
                  // });
                },
                labelType: NavigationRailLabelType.selected,
                destinations: [
                  NavigationRailDestination(
                    icon: Flexible(child: Icon(Icons.photo_outlined, size: 18)),
                    selectedIcon: Flexible(child: Icon(Icons.photo, size: 18)),
                    label: Text('Photos'),
                  ),
                  NavigationRailDestination(
                    icon:
                        Flexible(child: Icon(Icons.favorite_outline, size: 18)),
                    selectedIcon:
                        Flexible(child: Icon(Icons.favorite, size: 18)),
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
              // VerticalDivider(thickness: 1, width: 1),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(5),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: sizingInfo.screenSize.aspectRatio,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text('Test'),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
