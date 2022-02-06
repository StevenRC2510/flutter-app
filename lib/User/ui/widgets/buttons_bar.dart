import 'package:flutter/material.dart';

import 'package:hermes_app/User/ui/widgets/circle_button.dart';

class ButtonsBar extends StatelessWidget {
  const ButtonsBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[
            //Change password
            CircleButton(
              onPressed: () {  },
              mini: true,
              icon: Icons.vpn_key,
              iconSize: 20.0,
              color: const Color.fromRGBO(255, 255, 255, 0.6),
            ),
            //Add new place
            CircleButton(
              onPressed: () {  },
              mini: false,
              icon: Icons.add,
              iconSize: 40.0,
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
            //Exit to app
            CircleButton(
                onPressed: () {  },
                mini: true,
                icon: Icons.exit_to_app,
                iconSize: 20.0,
                color: const Color.fromRGBO(255, 255, 255, 0.6),
            ),
          ],
        )
    );
  }
}