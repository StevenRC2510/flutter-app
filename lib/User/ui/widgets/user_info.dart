import 'package:flutter/material.dart';

import 'package:hermes_app/User/model/user.dart';

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userPhoto = Container(
      width: 90.0,
      height: 90.0,
      margin: const EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white, width: 2.0, style: BorderStyle.solid),
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              //image: AssetImage(user.photoURL)
              image: NetworkImage(user.photoURL))),
    );

    final userInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.only(bottom: 5.0),
            child: Text(user.name,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Monserrat',
                ))),
        Text(user.email,
            style: const TextStyle(
                fontSize: 15.0, color: Colors.black, fontFamily: 'Monserrat')),
      ],
    );


    final profileInfo = Column(
        children: <Widget>[
          Container(
            height: 10,
            width: 10,
            margin: EdgeInsets.only(top: 10),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(user.photoURL),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 2.5,
                    width: 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Nicolas Adams',
          ),
          SizedBox(height: 10),
          Text(
            'nicolasadams@gmail.com',
          ),
          SizedBox(height: 20),
          Container(
            height: 4,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Theme.of(context).accentColor,
            ),
            child: Center(
              child: Text(
                'Upgrade to PRO',
              ),
            ),
          ),
        ],
      );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
      child: Column(
        children: <Widget>[userPhoto, userInfo, profileInfo],
      ),
    );
  }
}
