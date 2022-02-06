import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final String label;
  final TextInputType inputType;
  final TextEditingController controller;
  int maxLines;

  TextInput(
      {Key? key,
      required this.hintText,
      required this.inputType,
      required this.controller,
      this.label = "",
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontFamily: "Monserrat",
                  color: Color(0xFF252129),
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            TextField(
              controller: controller,
              keyboardType: inputType,
              maxLines: maxLines,
              style: const TextStyle(
                fontSize: 16.0,
                fontFamily: "Monserrat",
                color: Colors.blueGrey,
                //fontWeight: FontWeight.bold
              ),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  border: InputBorder.none,
                  hintText: hintText,
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF78747B)),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF3483FA)),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)))),
            ),
          ],
        ));
  }
}
