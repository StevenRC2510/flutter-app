import 'dart:io';

import 'package:flutter/material.dart';

import 'package:hermes_app/widgets/button.dart';
import 'package:hermes_app/widgets/text_input.dart';
import 'package:hermes_app/widgets/header_gradient.dart';

class AddWindowScreen extends StatefulWidget {
  const AddWindowScreen({Key? key}) : super(key: key);

  @override
  State createState() {
    return _AddWindowScreen();
  }
}

class _AddWindowScreen extends State<AddWindowScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();

    void onSubmit() {}

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: [
            HeaderGradient(height: 160.0),
            const Text(
              "Crear inmueble",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        /*
        TextInput(
          hintText: "Select ciudad",
          inputType: TextInputType.text,
          maxLines: 1,
          controller: _controllerTitlePlace,
        ),
        TextInput(
          hintText: "numero de calle",
          inputType: TextInputType.text,
          maxLines: 1,
          controller: _controllerTitlePlace,
        ),*/
        TextInput(
          label: "Codigo Postal",
          hintText: "ingresa el codigo postal",
          inputType: TextInputType.text,
          maxLines: 1,
          controller: _controllerTitlePlace,
        ),
        TextInput(
          //Description
          hintText: "Description",
          inputType: TextInputType.multiline,
          maxLines: 4,
          controller: _controllerDescriptionPlace,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your username',
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child:
            Button(
                text: "Crear",
                onPressed: () => onSubmit(),
                width: 300.0,
                height: 50.0,
                color: const Color(0xFF7C01FF),
                textColor: Colors.white)
        )
      ],
    );
  }
}
