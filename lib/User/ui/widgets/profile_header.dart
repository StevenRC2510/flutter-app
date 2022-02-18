import 'package:flutter/material.dart';

import 'package:hermes_app/shared/styles/colors.dart';

class ProfileHeader extends CustomPainter {
  final Size deviceSize;

  ProfileHeader({required this.deviceSize});

  @override
  void paint(Canvas canvas, Size size) {
    const Gradient gradient = LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          GlobalColors.electricPurple700,
          GlobalColors.electricPurple400,
          GlobalColors.electricPurple200
        ]);
    Rect rect = Rect.fromCircle(
      center: Offset(deviceSize.height / 2, deviceSize.width / 2),
      radius: deviceSize.width * 0.5,
    );
    var paint = Paint()..shader = gradient.createShader(rect);
    paint.color = Colors.green;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, deviceSize.height * 0.25);
    path.quadraticBezierTo(deviceSize.width * .1, deviceSize.height * 0.35,
        deviceSize.width * .30, deviceSize.height * 0.30);
    path.lineTo(deviceSize.width, deviceSize.height * 0.15);
    path.lineTo(deviceSize.width, 0);
    path.lineTo(0, 0);

    canvas.drawShadow(path, Colors.black54, 5.0, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
