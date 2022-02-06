import 'package:flutter/material.dart';

import 'package:hermes_app/widgets/header_gradient.dart';
import 'package:hermes_app/User/ui/widgets/buttons_bar.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showProfileData();
  }


  Widget showProfileData() {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: [
            HeaderGradient(height: 160.0),
            const Text(
              "Perfil",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        const ButtonsBar()
      ],
    );
  }
}
