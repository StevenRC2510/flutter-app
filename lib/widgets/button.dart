import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color color;
  final Color textColor;
  final bool hasIcon;
  final Duration duration = const Duration(milliseconds: 50);
  final double opacity = 0.7;

  const Button(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.height,
      this.width,
      this.textColor = Colors.black,
      this.color = Colors.white,
      this.hasIcon = false})
      : super(key: key);

  @override
  State createState() {
    return _Button();
  }
}

class _Button extends State<Button> {
  bool isDown = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: (_) => setState(() => isDown = true),
      onTapUp: (_) => setState(() => isDown = false),
      onTapCancel: () => setState(() => isDown = false),
      child: AnimatedOpacity(
        duration: widget.duration,
        opacity: isDown ? widget.opacity : 1,
        child: Container(
            margin: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
            width: widget.width,
            height: widget.height,
            //PUT CUSTOM COLORS
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: widget.color,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //const Icon(Icons.mail_outline, color: Colors.black87),
                  Text(
                    widget.text,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "Monserrat",
                        color: widget.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ])),
      ),
    );
  }
}
