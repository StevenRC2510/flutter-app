import 'package:flutter/material.dart';

class TextFormInput extends StatelessWidget {
  final String label;
  final String error;
  final TextInputType keyboardType;
  final TextEditingController controller;

  TextFormInput(
      {Key? key,
      required this.controller,
      required this.label,
      required this.error,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        border: InputBorder.none,
        //TODO: make a constant in order to not repeat
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF3483FA)),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF78747B)),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF3483FA)),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
      ),
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return error;
        }
        return null;
      },
      /*
      validator: (value) {
        if (value!.isEmpty) {
          return error;
        }
        return null;
      },*/
      onSaved: (value) {
        print("this=> $value");
      },
    );
  }
}
