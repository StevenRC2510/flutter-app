import 'package:flutter/material.dart';

import 'package:hermes_app/User/model/user.dart';
import 'package:hermes_app/User/ui/widgets/profile_row.dart';
import 'package:hermes_app/User/ui/widgets/buttons_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hermes_app/User/ui/widgets/profile_header.dart';

class ProfileTest extends StatefulWidget {
  final Size screenSize;

  const ProfileTest({Key? key, required this.screenSize}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileTest> with TickerProviderStateMixin {
  late Animation<double> fadeAnimation;
  late AnimationController fadeController;
  late Animation<double> editAnimation;
  late AnimationController editController;
  final User userTemp = User(
      uid: '1',
      name: 'Steven Ruiz',
      email: 'stevenruiz@habi.co',
      photoURL:
          "https://i.pinimg.com/originals/3e/e9/46/3ee946b27fd1cc5eb0b485e4a0669534.jpg");

  var result =
      "https://pixinvent.com/materialize-material-design-admin-template/app-assets/images/user/12.jpg";

  @override
  void initState() {
    editController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    editAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: editController,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );

    fadeController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: fadeController,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeOut,
        )));

    fadeController.forward();
    super.initState();
  }

  void onPressed() {
    if (editController.status != AnimationStatus.completed) {
      editController.forward();
      fadeController.reverse();
    } else {
      editController.forward();
      fadeController.stop();
    }
  }

  void onReverse() {
    if (editController.status == AnimationStatus.completed) {
      fadeController.reverse();
      editController.reverse();
    } else {
      fadeController.forward();
      fadeController.stop();
    }
  }

  @override
  void dispose() {
    fadeController.dispose();
    editController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(children: <Widget>[
            FadeTransition(
              opacity: fadeAnimation,
              child: Container(
                width: widget.screenSize.width,
                margin: EdgeInsets.only(bottom: 15.0),
                child: Stack(children: <Widget>[
                  CustomPaint(
                    painter: ProfileHeader(deviceSize: widget.screenSize),
                  ),
                  Container(
                      width: 150.0,
                      height: 150.0,
                      margin: EdgeInsets.only(
                          left: widget.screenSize.width / 2,
                          top: widget.screenSize.height * 0.1),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius: 4.0,
                                offset: Offset(0.0, 5.0)),
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(userTemp.photoURL),
                          ))),
                  Container(
                      margin: EdgeInsets.only(
                          left: widget.screenSize.width * 0.05,
                          top: widget.screenSize.height * 0.10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              userTemp.name,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              userTemp.email,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 14.0,
                              ),
                            ),
                          ])),
                ]),
              ),
            ),
            FadeTransition(
              opacity: fadeAnimation,
              child: Container(
                padding: EdgeInsets.all(widget.screenSize.width * 0.1),
                child: Column(
                  children: <Widget>[
                    const ButtonsBar(),
                    const SizedBox(height: 50.0),
                    /*
                    ProfileRow(
                      title: "Alias",
                      content: "Iron Man",
                      icon: FontAwesomeIcons.user,
                      iconColor: Colors.amber.shade800,
                    ),*/
                    ProfileRow(
                      title: "Número de contacto",
                      content: "+57 3207678655",
                      icon: FontAwesomeIcons.phone,
                      iconColor: Colors.blueGrey,
                      //iconColor: Colors.lightGreen,
                    ),
                    ProfileRow(
                      title: "Role",
                      content: "Ventanero",
                      icon: FontAwesomeIcons.addressCard,
                      iconColor: Colors.blueGrey,
                    ),
                    ProfileRow(
                      title: "Pais",
                      content: "México 🇲🇽",
                      icon: FontAwesomeIcons.globeAsia,
                      iconColor: Colors.blueGrey,
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
