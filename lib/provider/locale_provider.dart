import 'package:flutter/material.dart';

import 'package:hermes_app/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
   Locale _locale = const Locale('es', 'CO');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = 'es' as Locale;
    notifyListeners();
  }
}