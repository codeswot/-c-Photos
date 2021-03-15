import 'package:flutter/material.dart';
import 'package:flutter_firebase_starter/responsive_builder/responsive_builder.dart';

class MediumScreenHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Scaffold(
          appBar: AppBar(elevation: 0),
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
                    icon: Icon(Icons.favorite_border),
                    selectedIcon: Icon(Icons.favorite),
                    label: Text('First'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.bookmark_border),
                    selectedIcon: Icon(Icons.book),
                    label: Text('Second'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.star_border),
                    selectedIcon: Icon(Icons.star),
                    label: Text('Third'),
                  ),
                ],
              ),
              VerticalDivider(thickness: 1, width: 1),
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
