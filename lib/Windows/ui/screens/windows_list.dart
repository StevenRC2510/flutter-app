import 'package:flutter/material.dart';

import 'package:hermes_app/Windows/ui/widgets/card_window.dart';
import 'package:hermes_app/widgets/floating_action_button.dart';
import 'package:hermes_app/Windows/ui/screens/windows_header.dart';

class WindowList extends StatelessWidget {
  const WindowList({Key? key}) : super(key: key);
  void onPressAction() {}
  @override
  Widget build(BuildContext context) {
    return Stack(
      //alignment: const Alignment(0.9,0.95),
      children: <Widget>[
        ListView(
          padding: EdgeInsets.only(top: 250.0),
          children: const <Widget>[
            CardWindow(),
            CardWindow(),
            CardWindow(),
            CardWindow(),
            CardWindow(),
          ],
        ),
        const WindowsHeader(),
        Positioned(
          right: 20.0,
          bottom: 20.0,
          child: FloatingActionButtonCustom(
              color: Colors.deepPurpleAccent,
              iconData: Icons.add,
              onPressed: onPressAction),
        ),
      ],
    );
  }
}
