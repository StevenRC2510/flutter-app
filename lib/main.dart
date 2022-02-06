import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'package:hermes_app/hermes_app.dart';
import 'package:hermes_app/User/bloc/bloc_user.dart';
import 'package:hermes_app/hermes_app_cupertino.dart';
import 'package:hermes_app/User/ui/screens/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

//THEME WITH CUSTOM COLORS
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: const MaterialApp(
          title: 'Flutter Demo',
          home: SignInScreen(),
        ),bloc: UserBloc());
  }
}
