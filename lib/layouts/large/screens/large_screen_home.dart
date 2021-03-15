import 'package:flutter/material.dart';
import 'package:flutter_firebase_starter/responsive_builder/responsive_builder.dart';

class LargeScreenHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Scaffold(
          appBar: PreferredSize(
            child: CAppBar(
              leading: Text('[C] Photos'),
              body: SearchBar(),
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
            preferredSize: Size.fromHeight(100),
          ),
          body: Row(
            children: [
              NavigationRail(
                extended: true,
                selectedIndex: 0,
                onDestinationSelected: (int index) {
                  // setState(() {
                  //   _selectedIndex = index;
                  // });
                },
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
              // VerticalDivider(thickness: 1, width: 1),
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
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
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

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            hintText: 'Search photos',
          ),
        ),
      ),
    );
  }
}

class CAppBar extends StatelessWidget {
  const CAppBar({
    Key key,
    this.leading,
    this.body,
    this.trailing,
  }) : super(key: key);
  final Widget leading;
  final Widget body;
  final Widget trailing;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (leading ?? Container()),
          (body ?? Container()),
          (trailing ?? Container()),
        ],
      ),
    );
  }
}
