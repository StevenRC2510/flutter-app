import 'dart:ffi';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final String label;
  //final Array options;

  const Dropdown({Key? key, this.label = ""}) : super(key: key);

  @override
  State<Dropdown> createState() => _Dropdown();
}

class _Dropdown extends State<Dropdown> {
  String dropdownValue = 'One';

  Widget customIcon() {
    return Transform.rotate(
      angle: 90 * math.pi / 180,
      child: const IconButton(
        icon: Icon(
          Icons.chevron_right_rounded,
          color: Colors.black,
        ),
        onPressed: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Text(
            widget.label,
            style: const TextStyle(
                fontSize: 12.0,
                fontFamily: "Monserrat",
                color: Color(0xFF252129),
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
         //padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFF78747B)),
              borderRadius: BorderRadius.circular(8.0)),
          child: DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            icon: customIcon(),
            elevation: 16,
            style: const TextStyle(color: Color(0xFF252129)),
            underline: Container(
              height: 0,
              /*color: Colors.deepPurpleAccent,*/
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
