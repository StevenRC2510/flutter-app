import 'package:flutter/material.dart';

import 'package:hermes_app/shared/styles/colors.dart';

class TextFieldTwo extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  const TextFieldTwo({Key? key,
    required this.hintText,
    required this.prefixIconData,
    required this.suffixIconData,
    required this.obscureText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      cursorColor: GlobalColors.electricPurple600,
      style: const TextStyle(
        color: GlobalColors.electricPurple600,
        fontSize: 14.0,
      ),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: GlobalColors.electricPurple600),
        focusColor: GlobalColors.electricPurple600,
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: GlobalColors.electricPurple600),
        ),
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 18,
          color: GlobalColors.electricPurple600,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
          },
          child: Icon(
            suffixIconData,
            size: 18,
            color: GlobalColors.electricPurple600,
          ),
        ),
      ),
    );
  }
}