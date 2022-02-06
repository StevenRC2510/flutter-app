import 'package:flutter/material.dart';

import 'package:hermes_app/widgets/header_gradient.dart';

class WindowsHeader extends StatelessWidget {
  const WindowsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        HeaderGradient(height: 160.0),
        const Text(
          "Listado inmuebles",
          style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontFamily: "Lato",
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
