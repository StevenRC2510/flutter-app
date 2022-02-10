import 'package:flutter/material.dart';

import 'package:hermes_app/widgets/header_gradient.dart';
import 'package:hermes_app/User/ui/screens/profile_header.dart';
import 'package:hermes_app/User/ui/widgets/profile_background.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:  <Widget>[
        //ProfileBackground(),
        ProfileHeader(),
      ],
    );
  }

}