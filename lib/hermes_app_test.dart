import 'package:flutter/material.dart';

import 'package:hermes_app/shared/styles/colors.dart';
import 'package:hermes_app/User/ui/screens/profile.dart';
import 'package:hermes_app/Windows/ui/screens/windows_list.dart';
import 'package:hermes_app/Windows/ui/screens/window_form.dart';

class AnimatedBottomBar extends StatefulWidget {
  const AnimatedBottomBar({Key? key}) : super(key: key);

  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
  late int _currentPage;
  late Size screenSize;

  @override
  void initState() {
    _currentPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      //backgroundColor: Color(0xFFF2F3F4),
      body: getPage(_currentPage),
      bottomNavigationBar: AnimatedBottomNav(

          currentIndex: _currentPage,
          onChange: (index) {
            setState(() {
              _currentPage = index;
            });
          }),
    );
  }

  getPage(int page) {
    switch(page) {
      case 0:
        return  const WindowList();
      case 1:
        return const AddWindowScreen();
      case 2:
        return const Profile();
    }
  }
}

class AnimatedBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onChange;
  const AnimatedBottomNav({Key? key, required this.currentIndex, required this.onChange})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      decoration: const BoxDecoration(color: GlobalColors.electricPurple500),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => onChange(0),
              child: BottomNavItem(
                icon: Icons.home,
                title: "Home",
                activeColor: Colors.white,
                inactiveColor: Colors.white,

                isActive: currentIndex == 0,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onChange(1),
              child: BottomNavItem(
                icon: Icons.add_business,
                title: "Crear ventana",
                activeColor: Colors.white,
                inactiveColor: Colors.white,
                isActive: currentIndex == 1,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onChange(2),
              child: BottomNavItem(
                icon: Icons.person,
                title: "Perfil",
                activeColor: Colors.white,
                inactiveColor: Colors.white,
                isActive: currentIndex == 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final Color activeColor;
  final Color inactiveColor;
  final String title;
  const BottomNavItem(
      {Key? key,
        this.isActive = false,
        required this.icon,
        required this.activeColor,
        required this.inactiveColor,
        required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 200),
      child: isActive
          ? Container(
        color: GlobalColors.electricPurple500,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: activeColor,
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              width: 5.0,
              height: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: activeColor,
              ),
            ),
          ],
        ),
      )
          : Icon(
        icon,
        color: inactiveColor,
      ),
    );
  }
}