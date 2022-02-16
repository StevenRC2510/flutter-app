import 'package:flutter/material.dart';

class TextFormInput extends StatelessWidget {
  late String field;
  final String label;
  final String error;
  final TextInputType keyboardType;

  TextFormInput(
      {Key? key, required this.field, required this.label, required this.error, this.keyboardType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        border: InputBorder.none,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF78747B)),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF3483FA)),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
      ),
      keyboardType: keyboardType ,
      validator: (value) {
        if (value!.isEmpty) {
          return error;
        }
        return null;
      },
      onSaved: (value) {
        field = value!;
      },
    );
  }
}
