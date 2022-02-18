import 'package:flutter/material.dart';

class ProfileRow extends StatefulWidget {
  final String title;
  final String content;
  final IconData icon;
  final Color iconColor;

  const ProfileRow(
      {Key? key,
      required this.title,
      required this.content,
      required this.icon,
      this.iconColor = Colors.indigo})
      : super(key: key);

  @override
  _ProfileRowState createState() => _ProfileRowState();
}

class _ProfileRowState extends State<ProfileRow>
    with SingleTickerProviderStateMixin {
  //late AnimationController _controller;
  //late Animation<double> _animation;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double rowWidth = MediaQuery.of(context).size.width * 0.8;
    return FadeTransition(
      opacity: _animation,
      child: Container(
          margin: EdgeInsets.only(bottom: 25),
          width: rowWidth,
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4.0,
                          offset: Offset(0.0, 1.0)),
                    ],
                    shape: BoxShape.circle),
                child: IconButton(
                    icon: Icon(
                      widget.icon,
                    ),
                    iconSize: 25.0,
                    color: widget.iconColor,
                    onPressed: () {}),
              ),
              SizedBox(
                width: 30.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontFamily: "Monserrat",
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.black),
                  ),
                  Text(
                    widget.content,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black87,
                      fontFamily: "Monserrat",
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              )
            ],
          )),
    );
  }
}
