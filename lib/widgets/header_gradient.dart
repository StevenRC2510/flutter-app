import 'package:flutter/material.dart';

class HeaderGradient extends StatelessWidget {


  late final double height;

  HeaderGradient({Key? key, this.height = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    if(height == null){
      height = screenHeight;
    }

    return Container(
      width: screenWidth,
      height: height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF9634FF),
                Color(0xFF6301CC)
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.5, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp
          )
      ),
      child: FittedBox(
        fit: BoxFit.none,
        alignment: const Alignment(-1.5, -0.8),
        child: Container(
          width: screenHeight,
          height: screenHeight,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.05),
            borderRadius: BorderRadius.circular(screenHeight / 2),
          ),
        ),
      ),
    );
  }

}