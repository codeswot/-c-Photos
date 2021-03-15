import 'package:flutter/material.dart';
import 'package:flutter_firebase_starter/responsive_builder/responsive_builder.dart';

class SmallScreenHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return Scaffold(
          drawer: Drawer(),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
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
