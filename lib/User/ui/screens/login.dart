import 'package:hermes_app/states/auth.dart';
import 'package:provider/provider.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hermes_app/commons/snackbar.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();

  bool _obscureTextPassword = true;

  @override
  void dispose() {
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SizedBox(
                  width: 300.0,
                  height: 190.0,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextFormField(
                            initialValue: '',
                            focusNode: focusNodeEmail,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                                fontFamily: 'Monserrat',
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.mail_outline,
                                color: Colors.grey,
                                size: 24.0,
                              ),
                              hintText: 'Email Address',
                              hintStyle: TextStyle(
                                  fontFamily: 'Monserrat', fontSize: 16.0),
                            ),
                            onSaved: (String? email) {
                              _email = email ?? '';
                            },
                            onFieldSubmitted: (_) {
                              focusNodePassword.requestFocus();
                            },
                          ),
                        ),
                        Container(
                          width: 250.0,
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextFormField(
                            focusNode: focusNodePassword,
                            obscureText: _obscureTextPassword,
                            style: const TextStyle(
                                fontFamily: 'Monserrat',
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: const Icon(
                                Icons.lock_outline,
                                size: 24.0,
                                color: Colors.grey,
                              ),
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                  fontFamily: 'Monserrat', fontSize: 16.0),
                              suffixIcon: GestureDetector(
                                onTap: _toggleLogin,
                                child: Icon(
                                  _obscureTextPassword
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                  size: 15.0,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            onSaved: (String? password) {
                              _password = password ?? '';
                            },
                            onFieldSubmitted: (_) {
                              _toggleSignInButton();
                            },
                            textInputAction: TextInputAction.go,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 170.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  /*
                    boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color(0xFF9634FF),
                      offset: Offset(0.5, 0.5),
                      blurRadius: 20.0,
                    ),
                    BoxShadow(
                      color: Color(0xFF6301CC),
                      offset: Offset(1.0, 0.5),
                      blurRadius: 20.0,
                    ),
                  ],
                  gradient: LinearGradient(
                      colors: <Color>[Color(0xFF9634FF), Color(0xFF6301CC)],
                      begin: FractionalOffset(0.2, 0.2),
                      end: FractionalOffset(1.0, 1.0),
                      stops: <double>[0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: Button(
                    text: "Crear",
                    onPressed: () => CustomSnackBar(
                        context, const Text('Facebook button pressed')),
                    width: 300.0,
                    height: 50.0,
                    color: const Color(0xFF7C01FF),
                    textColor: Colors.white),
                  */
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.5),
                      offset: const Offset(0, 1),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  gradient: const LinearGradient(
                      colors: <Color>[Color(0xFF9634FF), Color(0xFF6301CC)],
                      begin: FractionalOffset(0.2, 0.2),
                      end: FractionalOffset(1.0, 1.0),
                      stops: <double>[0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: MaterialButton(
                  highlightColor: Colors.transparent,
                  splashColor: const Color(0xFFB067FF),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontFamily: 'Monserrat'),
                    ),
                  ),
                  onPressed: _toggleSignInButton,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: 'WorkSansMedium'),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[
                          Colors.white10,
                          Colors.white,
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 1.0),
                        stops: <double>[0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    'Or',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: 'WorkSansMedium'),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[
                          Colors.white,
                          Colors.white10,
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 1.0),
                        stops: <double>[0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: GestureDetector(
                  onTap: () => CustomSnackBar(
                      context, const Text('Google button pressed')),
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(0, 1),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                    ),
                    child: const Icon(
                      FontAwesomeIcons.google,
                      color: Color(0xFF0084ff),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

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

  void _toggleLogin() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
}
