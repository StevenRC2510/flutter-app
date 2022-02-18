import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:hermes_app/states/auth.dart';
import 'package:hermes_app/states/windows_state.dart';

import 'package:hermes_app/hermes_app.dart';
import 'package:hermes_app/User/ui/screens/login.dart';
import 'package:hermes_app/User/ui/screens/login_two.dart';
import 'package:hermes_app/widgets/language_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hermes_app/hermes_app_test.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  late PageController pageController;
  bool isLeft = true;

  final String logoPath = "assets/img/logo_habi.png";
  final String decorationStartPath = "assets/img/login_decoration_start.png";
  final String decorationEndPath = "assets/img/login_decoration_end.png";
  final String flagColombia = "assets/img/flag_colombia.svg";
  final String flagMexico = "assets/img/flag_mexico.svg";

  final COGNITO_CLIENT_ID = '7f86gu6fq8813e9ac23610lt2g';
  final COGNITO_POOL_ID = 'us-east-1_V5yhvlb7e';
  final COGNITO_POOL_URL = 'mx-habi-google-users-dev';
  final CLIENT_SECRET = '1p4np2cli46emihtu3uvups94v88653lgcrt4v679fuu4ic85f2c';

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return _handleCurrentSession(context);
  }

  onTapLoginButton(BuildContext context) => () {
        context.read<AuthProvider>().getUser();
      };

  Widget _handleCurrentSession(BuildContext context) {
    context.read<WindowProvider>().getWindows();
    if (context.watch<AuthProvider>().isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (context.watch<AuthProvider>().isLoggedIn) {
      return const AnimatedBottomBar();
      //return const HermesApp();
    }
    return signInGoogleUI(context);
  }

  Widget signInGoogleUI(BuildContext context) {
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: const [
          LoginTwo()
        ],
      )
      /*Stack(
        alignment: Alignment.center,
        children: <Widget>[
          //Container(color: Colors.white),
          Positioned(
            left: -1.0,
            top: -1.0,
            child: Image.asset(decorationStartPath, height: 130.0),
          ),
          Positioned(
            right: -1.0,
            bottom: -1.0,
            child: Image.asset(decorationEndPath, height: 130.0),
          ),
          //LanguagePickerWidget(),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -size.height * 0.1 : 0.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100.0),
                /*
                SvgPicture.asset(
                  flagColombia,
                  width: 300.0,
                  height: 50.0,
                ),
                SvgPicture.asset(
                  flagMexico,
                  width: 300.0,
                  height: 50.0,
                ),*/
                Image.asset(logoPath),
                const SignIn(),
              ],
            ),
          ),
          // Positioned(bottom: 30, child: SignIn()),
        ],
      ),*/
    );
  }
}
