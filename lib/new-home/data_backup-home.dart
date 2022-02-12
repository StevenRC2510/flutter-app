import 'package:flutter/material.dart';
import 'package:hermes_app/new-home/initial_page.dart';

const mainDataBackupColor = Color(0xFF5113AA);
const secondaryColorBackupColor = Color(0xFFBC53FA);
const backgroundColor = Color(0xFFFCE7FE);

class DataBackupHome extends StatelessWidget {
  const DataBackupHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: const InitialPage(),
      ),
    );
  }
}
