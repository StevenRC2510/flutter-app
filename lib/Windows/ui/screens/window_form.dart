import 'dart:io';
import 'package:flutter/material.dart';

import 'package:hermes_app/widgets/button.dart';
import 'package:hermes_app/widgets/dropdown.dart';
import 'package:hermes_app/widgets/text_input.dart';
import 'package:hermes_app/widgets/header_gradient.dart';
import 'package:hermes_app/Windows/ui/widgets/location_fields_form.dart';
import 'package:hermes_app/Windows/ui/widgets/info_property_fields_form.dart';

class AddWindowScreen extends StatefulWidget {
  const AddWindowScreen({Key? key}) : super(key: key);

  @override
  State createState() {
    return _AddWindowScreen();
  }
}

class _AddWindowScreen extends State<AddWindowScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password;
  final List<Widget> _propertyInfoList = [];
  final List<Widget> _propertyInfoList1 = [];

  final controllerAddress = TextEditingController();
  final controllerNumberAddress = TextEditingController();
  final controllerZipCode = TextEditingController();

  final controllerFirstPhone = TextEditingController();
  final controllerSecondaryPhone = TextEditingController();
  final controllerTower = TextEditingController();
  final controllerFloor = TextEditingController();
  final controllerDoorNumber = TextEditingController();
  final controllerContactName = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _propertyInfoList1.add(new InfoPropertyFieldsForm(
        controllerFirstPhone: controllerFirstPhone,
        controllerSecondaryPhone: controllerSecondaryPhone,
        controllerTower: controllerTower,
        controllerFloor: controllerFloor,
        controllerDoorNumber: controllerDoorNumber,
        controllerContactName: controllerContactName,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();

    void _addCardWidget() {
      setState(() {
        _propertyInfoList1.add(new InfoPropertyFieldsForm(
          controllerFirstPhone: controllerFirstPhone,
          controllerSecondaryPhone: controllerSecondaryPhone,
          controllerTower: controllerTower,
          controllerFloor: controllerFloor,
          controllerDoorNumber: controllerDoorNumber,
          controllerContactName: controllerContactName,
        ));
      });
    }

    void _onSubmit() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        final text1 = controllerAddress.text;
        final text2 = controllerNumberAddress.text;

        print("phoneeeee => $controllerFirstPhone");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Processing Data: => $text1 => $text2')),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: [
            HeaderGradient(height: 100.0),
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
        Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  LocationFieldsForm(
                      controllerAddress: controllerAddress,
                      controllerNumberAddress: controllerNumberAddress,
                      controllerZipCode: controllerZipCode),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                        itemCount: _propertyInfoList1.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _propertyInfoList1[index];
                        }),
                  ),
                  FloatingActionButton(
                    onPressed: _addCardWidget,
                    tooltip: 'Add',
                    child: Icon(Icons.add),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Button(
                        text: "Enviar",
                        onPressed: () => _onSubmit(),
                        width: 300.0,
                        height: 50.0,
                        color: const Color(0xFF7C01FF),
                        textColor: Colors.white),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
