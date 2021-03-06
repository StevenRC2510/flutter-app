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
        return 'π¨π΄';
      case 'es-mx':
        return 'π²π½';
      case 'en':
      default:
        return 'πΊπΈ';
    }
  }
}