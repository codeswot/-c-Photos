import 'package:flutter/material.dart';
import 'package:flutter_firebase_starter/responsive_builder/responsive_builder.dart';

class SmallScreenHome extends StatelessWidget {
  final dynamic data;

  const SmallScreenHome({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Scaffold(
          drawer: Drawer(),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Color(0xff5f6368),
            ),
            title: Text('[C]Photos'),
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
          ),
          body: GridView.count(
            padding: EdgeInsets.all(5),
            crossAxisCount: 2,
            crossAxisSpacing: 3,
            mainAxisSpacing: 3,
            children: List.generate(10, (index) {
              return Container(
                alignment: Alignment.center,
                child: Text('Test'),
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
              );
            }),
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
