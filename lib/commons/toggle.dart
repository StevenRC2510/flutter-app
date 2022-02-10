import 'package:flutter/material.dart';
import 'package:hermes_app/commons/bubbleIndicatorPainter.dart';

class CustomToggle extends StatelessWidget {
  final PageController pageController;
  final String titleLeft;
  final String titleRight;
  final bool isLeft;
  const CustomToggle(
      {Key? key,
      required this.pageController,
      required this.titleLeft,
      required this.titleRight,
      required this.isLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: BubbleIndicatorPainter(pageController: pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _actionLeftPress,
                child: Text(
                  'Existing',
                  style: TextStyle(
                      color: !isLeft ? Colors.white : Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'WorkSansSemiBold'),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _actionRightPress,
                child: Text(
                  'New',
                  style: TextStyle(
                      color: isLeft ? Colors.white : Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'WorkSansSemiBold'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _actionLeftPress() {
    pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _actionRightPress() {
    pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
