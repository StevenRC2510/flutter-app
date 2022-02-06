import 'package:flutter/material.dart';

import 'package:hermes_app/Windows/ui/widgets/window_image.dart';

class CardWindow extends StatelessWidget {
  const CardWindow({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final card =  Container(
      padding: const EdgeInsets.fromLTRB(10,10,10,0),
      margin: const EdgeInsets.only(left: 50.0),
      height: 220,
      width: double.maxFinite,
      child: const Card(
        elevation: 5,
        color: Colors.white70,
        shadowColor: Colors.black45,
      ),
    );
    return Stack(
      alignment: const Alignment(-1.0, 0.2),
      children: <Widget>[
        card,
        WindowImage(pathImage: "https://cdn.globalpropertyguide.com/assets/USA-1/US-2021.jpg", width: 150.0, height: 150.0),
      ],
    );
  }
}

