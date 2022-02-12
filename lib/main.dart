import 'package:flutter/material.dart';
import 'package:hermes_app/User/ui/screens/sign_in_screen.dart';
import 'package:hermes_app/repository/window_repository.dart';
import 'package:hermes_app/states/windows_state.dart';
import 'package:hermes_app/new-home/data_backup-home.dart';
import 'package:hermes_app/states/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

//THEME WITH CUSTOM COLORS
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          FutureProvider(
              create: (_) => WindowRepository().getProperties(),
              initialData: null),
          ChangeNotifierProvider(create: (_) => WindowProvider()..getWindows()),
          ChangeNotifierProvider(create: (_) => AuthProvider()..charge()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          home: SignInScreen(),
          // home: DataBackupHome(),
        ));
  }
}
