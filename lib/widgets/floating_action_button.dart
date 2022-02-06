import 'package:flutter/material.dart';

class FloatingActionButtonCustom extends StatefulWidget {

  final Color color;
  final IconData iconData;
  final VoidCallback onPressed;
  final bool mini;

  const FloatingActionButtonCustom({Key? key, required this.color, required this.iconData, required this.onPressed, this.mini = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionButtonCustom();
  }

}


class _FloatingActionButtonCustom extends State<FloatingActionButtonCustom> {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: widget.color,
      mini: widget.mini,
      onPressed: widget.onPressed,
      child: Icon(widget.iconData),
      heroTag: null,
      elevation: 5,
      splashColor: Colors.grey,
    );
  }

}