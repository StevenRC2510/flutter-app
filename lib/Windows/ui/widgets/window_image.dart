import 'package:flutter/material.dart';

class WindowImage extends StatelessWidget {

  final double height;
  final double width;
  double left = 20.0;
  final String pathImage;


  WindowImage({Key? key,
    required this.pathImage,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
          left: left
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(pathImage)
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: const <BoxShadow>[
            BoxShadow (
                color:  Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0)
            )
          ]
      ),
    );
    return card;
  }

}