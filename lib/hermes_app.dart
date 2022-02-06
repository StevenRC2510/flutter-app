import 'package:flutter/material.dart';

import 'package:hermes_app/User/ui/screens/profile.dart';
import 'package:hermes_app/User/ui/screens/sign_in_screen.dart';
import 'package:hermes_app/Windows/ui/screens/windows_list.dart';
import 'package:hermes_app/Windows/ui/screens/window_form.dart';

class HermesApp extends StatefulWidget {
  const HermesApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HermesApp();
  }

}

class _HermesApp extends State<HermesApp> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    const WindowList(),
    const AddWindowScreen(),
    const Profile()
  ];

  void onTapTapped(int index){

    setState(() {
      indexTap = index;
    });

  }

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
        body: widgetsChildren[indexTap],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
              primaryColor: Colors.deepPurple,
          ),
          child: BottomNavigationBar(
              onTap: onTapTapped,
              currentIndex: indexTap,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.create_new_folder),
                    label: ""
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: ""
                ),
              ]
          ),
        ),
      );
  }

}