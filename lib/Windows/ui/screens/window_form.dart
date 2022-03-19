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
  late final String _countryState = "",
      _address = "",
      _numberAddress = "",
      _zipCode = "",
      _firstPhone = "",
      _secondaryPhone = "",
      _tower = "",
      _floor = "",
      _doorNumber = "",
      _contactName = "";
/*
  late final String _countryState = "";
  late final String _address = "";
  late final String _numberAddress = "";
  late final String _zipCode = "";
  late final String _firstPhone = "";
  late final String _secondaryPhone = "";
  late final String _tower = "";
  late final String _floor = "";
  late final String _doorNumber = "";
  late final String _contactName = "";*/
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password;
  final List<Widget> _propertyInfoList = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();

    void _addCardWidget() {
      setState(() {
        _propertyInfoList.add(LocationFieldsForm(
            countryState: _countryState,
            address: _address,
            numberAddress: _numberAddress,
            zipCode: _zipCode));
      });
    }

    void _onSubmit() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        print(_address);
        print(_numberAddress);
        print(_zipCode);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Processing Data: $_address => $_email => $_password')),
        );
      }
    }

    return SingleChildScrollView(
      child: Column(
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
            child: Column(
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email:'),
                          onSaved: (input) => _email = input!,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password:'),
                          onSaved: (input) => _password = input!,
                          obscureText: true,
                        ),
                        LocationFieldsForm(
                            countryState: _countryState,
                            address: _address,
                            numberAddress: _numberAddress,
                            zipCode: _zipCode),
                        /* InfoPropertyFieldsForm(
                            firstPhone: _firstPhone,
                            secondaryPhone: _secondaryPhone,
                            tower: _tower,
                            floor: _floor,
                            doorNumber: _doorNumber,
                            contactName: _contactName),
                        /**/
                        _buildAddress(),*/
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            onPressed: () => _onSubmit(),
                            child: const Text('First Submit'),
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xFF7C01FF),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 5),
                                textStyle: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        /*
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: 300.0,
                              height: 50.0,
                              child: RaisedButton(
                                color: const Color(0xFF7C01FF),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();

                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                            'Email: $_address and Password $_zipCode')));
                                    print(_formKey.currentState);
                                  }
                                },
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: const BorderSide(
                                        color: Colors.deepPurpleAccent)),
                              ),
                            )),*/
                      ],
                    )),
                FloatingActionButton(
                  onPressed: _addCardWidget,
                  tooltip: 'Add',
                  child: Icon(Icons.add),
                ),
                /*
                const Dropdown(label: "Estado"),
                TextInput(
                  label: "Dirección del inmueble",
                  hintText: "ingresa la dirección del inmueble",
                  inputType: TextInputType.text,
                  maxLines: 1,
                  controller: _controllerTitlePlace,
                ),
                TextInput(
                  label: "Número de calle",
                  hintText: "ingresa el numero de calle del inmueble",
                  inputType: TextInputType.text,
                  maxLines: 1,
                  controller: _controllerTitlePlace,
                ),
                TextInput(
                  label: "Código Postal",
                  hintText: "ingresa el código postal",
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
                ),*/
                Container(
                    alignment: Alignment.center,
                    child: Button(
                        text: "Enviar",
                        onPressed: () => _onSubmit(),
                        width: 300.0,
                        height: 50.0,
                        color: const Color(0xFF7C01FF),
                        textColor: Colors.white))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
