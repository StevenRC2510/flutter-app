import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en',''),
    const Locale('es','co'),
    const Locale('es','mx'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'es-co':
        return '🇨🇴';
      case 'es-mx':
        return '🇲🇽';
      case 'en':
      default:
        return '🇺🇸';
    }
  }
}