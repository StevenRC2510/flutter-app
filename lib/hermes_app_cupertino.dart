import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:hermes_app/User/ui/screens/profile.dart';

class HermesAppCupertino extends StatelessWidget {
  const HermesAppCupertino({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            items: const <BottomNavigationBarItem> [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.indigo),
                  label: ""
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.indigo),
                  label: ""
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.indigo),
                  label: ""
              ),
            ]
        ),

        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return Center(
                child: Text('Content of tab $index'),
              );
            },
          );
        },
      ),
    );
  }
}