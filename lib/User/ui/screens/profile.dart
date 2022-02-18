import 'package:flutter/material.dart';

import 'package:hermes_app/widgets/header_gradient.dart';
import 'package:hermes_app/User/ui/screens/profile_header.dart';
import 'package:hermes_app/User/ui/widgets/profile_background.dart';
import 'package:hermes_app/User/ui/screens/profile_test.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileState();
  }

}

class _ProfileState extends State<Profile> {
  late Size screenSize;


  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    return ProfileTest(screenSize: screenSize,);
  }

}
