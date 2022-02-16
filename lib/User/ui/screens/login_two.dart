import 'package:flutter/material.dart';

import 'package:hermes_app/widgets/button.dart';
import 'package:hermes_app/widgets/text_field_two.dart';
import 'package:hermes_app/animation/fade_animation.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:provider/provider.dart';
import 'package:hermes_app/states/auth.dart';
import 'package:hermes_app/commons/snackbar.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';


class LoginTwo extends StatefulWidget {
  const LoginTwo({Key? key}) : super(key: key);

  @override
  _LoginTwo createState() => _LoginTwo();
}

class _LoginTwo extends State<LoginTwo> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  final userPool = CognitoUserPool(
      'us-east-1_V5yhvlb7e', '7f86gu6fq8813e9ac23610lt2g',
      endpoint: 'mx-habi-google-users-dev',
      clientSecret: '1p4np2cli46emihtu3uvups94v88653lgcrt4v679fuu4ic85f2c');

  void _toggleSignInButton() async {
    _formKey.currentState?.save();
    String? message;
    final cognitoUser = CognitoUser('stevenruiz@habi.co', userPool);
    final authDetails = AuthenticationDetails(
      username: 'stevenruiz@habi.co',
      password: "D3v3l0p3rcali\$",
    );
    CognitoUserSession? session;
    try {
      session = await cognitoUser.authenticateUser(authDetails);
    } on CognitoClientException catch (e) {
      if (e.code == 'InvalidParameterException' ||
          e.code == 'NotAuthorizedException' ||
          e.code == 'UserNotFoundException' ||
          e.code == 'ResourceNotFoundException') {
        message = e.message;
      } else {
        message = 'An unknown client error occured';
      }
      // handle New Password challenge
    } catch (e) {
      print(e);
      print('aqui');
    }
    print(message);
    print(session?.getAccessToken().getJwtToken());

    context.read<AuthProvider>().getUser();
    CustomSnackBar(context, Text('Login button pressed, email: ${_email}'));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 400,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -40,
                  height: 400,
                  width: width,
                  child: FadeAnimation(
                      1,
                      Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/img/background-login.png'),
                                fit: BoxFit.fill)),
                      )),
                ),
                Positioned(
                  height: 400,
                  width: width + 20,
                  child: FadeAnimation(
                      1.3,
                      Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/img/background-login-2.png'),
                                fit: BoxFit.fill)),
                      )),
                ),
                Positioned(
                  left: 30,
                  width: 80,
                  height: 200,
                  child: FadeAnimation(
                      1,
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/img/light-1.png'))),
                      )),
                ),
                Positioned(
                  left: 140,
                  width: 80,
                  height: 150,
                  child: FadeAnimation(
                      1.3,
                      Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/img/light-2.png'))),
                      )),
                ),
                Positioned(
                  left: width / 2.7,
                  top: 150,
                  width: 100,
                  height: 100,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/img/logo_habi.png'))),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const FadeAnimation(
                    1.5,
                    Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: "Monserrat",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )),
                const SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                    1.7,
                    Center(
                      child: Column(
                        children: <Widget>[
                          TextFieldTwo(
                            hintText: 'Email',
                            obscureText: false,
                            prefixIconData: Icons.mail_outline,
                            suffixIconData: Icons.check,
                            onChanged: (value) {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldTwo(
                              onChanged: (value) {},
                              hintText: 'Password',
                              obscureText: true,
                              prefixIconData: Icons.lock_outline,
                              suffixIconData: Icons.visibility),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                    1.9,
                    Button(
                        text: "Login",
                        onPressed: () => _toggleSignInButton(),
                        width: 300.0,
                        height: 50.0,
                        color: const Color(0xFF7C01FF),
                        textColor: Colors.white)),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: SignInButton(
                    Buttons.Google,
                    text: "Sign in with Google",
                    onPressed: () {
                      _toggleSignInButton();
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
