import 'package:flutter/material.dart';

import 'package:hermes_app/hermes_app.dart';
import 'package:hermes_app/widgets/button.dart';
import 'package:hermes_app/User/bloc/bloc_user.dart';
import 'package:hermes_app/widgets/header_gradient.dart';

import 'package:hermes_app/widgets/gradient_background.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);


  @override
  State createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  late UserBloc userBloc;

  String logoPath = "assets/img/logo_habi.png";
  String decorationStartPath = "assets/img/login_decoration_start.png";
  String decorationEndPath = "assets/img/login_decoration_end.png";

  final COGNITO_CLIENT_ID = '7f86gu6fq8813e9ac23610lt2g';
  final COGNITO_POOL_ID = 'us-east-1_V5yhvlb7e';
  final COGNITO_POOL_URL = 'mx-habi-google-users-dev';
  final CLIENT_SECRET = '1p4np2cli46emihtu3uvups94v88653lgcrt4v679fuu4ic85f2c';
  final bool show = false;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  void onTapLoginButton(){

  }


  Widget _handleCurrentSession(){
    if(show) {
      return signInGoogleUI();
    } else {
      return HermesApp();
    }
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children:  <Widget>[
          //Container(color: Colors.white),
          const GradientBackground(title: ""),
          Positioned(
              left: -1.0,
              top: -1.0,
              child:
                Image.asset(decorationStartPath,  height: 200.0),
          ),
          Positioned(
            right: -1.0,
            bottom: -1.0,
            child:
            Image.asset(decorationEndPath, height: 180.0),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              Image.asset(logoPath),
              Button(text: "Login with Gmail",
                onPressed: () => onTapLoginButton(),
                width: 300.0,
                height: 50.0,
              )
            ],
          )
        ],
      ),
    );
  }
}