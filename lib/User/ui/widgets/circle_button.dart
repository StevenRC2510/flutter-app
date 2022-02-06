import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool mini;
  final dynamic icon;
  final double? iconSize;
  final dynamic color;

  const CircleButton ({Key? key, required this.onPressed,  this.mini = false, this.icon, this.iconSize, this.color }) :super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CircleButton();
  }

}

class _CircleButton extends State<CircleButton> {
  void onPressedButton() {

  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FloatingActionButton(
          backgroundColor: widget.color,
          mini: widget.mini,
          onPressed: widget.onPressed,
          child: Icon(
            widget.icon,
            size: widget.iconSize,
            color: const Color(0xFF4268D3),
          ),
        )
    );
  }
}