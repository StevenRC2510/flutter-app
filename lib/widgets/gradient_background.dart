import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {


  final String title;
  final double? height;
  //double height = 0.0;

  //GradientBack(this.title, this.height, {Key? key}) : super(key: key);
  const GradientBackground({Key? key, required this.title, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                //Color(0xFF7C01FF),
                //Color(0xFF5701b3),
                //Color(0xFF9634FF),
                //Color(0xFFFFFFFF)
                //0xFF6301CC
                Color(0xFFCB99FF),
                Color(0xFFFFFFFF),
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1, 0.6),
              stops: [0.0, 0.9],
              tileMode: TileMode.clamp
          )
      ),

      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: "Monserrat",
            fontWeight: FontWeight.bold
        ),
      ),

      alignment: const Alignment(-0.9, -0.6),

    );
  }

}