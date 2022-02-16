import 'package:flutter/material.dart';

import 'package:hermes_app/l10n/l10n.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart';
import 'package:hermes_app/states/auth.dart';
import 'package:hermes_app/states/windows_state.dart';
import 'package:hermes_app/provider/locale_provider.dart';
import 'package:hermes_app/repository/window_repository.dart';
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
    //final provider = Provider.of<LocaleProvider>(context);

    return MultiProvider(
        providers: [
          FutureProvider(
              create: (_) => WindowRepository().getProperties(),
              initialData: null),
          ChangeNotifierProvider(create: (_) => WindowProvider()..getWindows()),
          ChangeNotifierProvider(create: (_) => AuthProvider()..charge()),
          //ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ],
        child: const MaterialApp(
          title: 'Hermes app',
          home: SignInScreen(),
          // home: DataBackupHome(),
        ));
  }
}

/*
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);

        return MaterialApp(
          title: 'Hermes app',
          locale: provider.locale,
          supportedLocales: L10n.all,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: const SignInScreen(),
        );
      },
* */