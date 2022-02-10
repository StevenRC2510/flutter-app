import 'package:flutter/material.dart';
import 'package:hermes_app/User/model/user.dart';

import 'package:hermes_app/widgets/header_gradient.dart';
import 'package:hermes_app/User/ui/widgets/user_info.dart';
import 'package:hermes_app/User/ui/widgets/buttons_bar.dart';

class ProfileHeader extends StatelessWidget {

  ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showProfileData();
  }

  final User userTemp = User(uid: '1',name: 'Steven', email: 'stevenruiz@habi.co', photoURL: "https://i.pinimg.com/originals/3e/e9/46/3ee946b27fd1cc5eb0b485e4a0669534.jpg");
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
            UserInfo(user: userTemp)
          ],
          //UserInfo(user);
        ),
        const ButtonsBar()
      ],
    );
  }
}
