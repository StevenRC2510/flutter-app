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
  late final String _countryState = "";
  late final String _address = "";
  late final String _numberAddress = "";
  late final String _zipCode = "";
  late final String _firstPhone = "";
  late final String _secondaryPhone= "";
  late final String _tower= "";
  late final String _floor= "";
  late final String _doorNumber= "";
  late final String _contactName= "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /*

  Widget _buildAddress() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Dirección del inmueble',
        filled: true,
        fillColor: Color(0xFFFFFFFF),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF78747B)),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF3483FA)),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
      ),
      maxLength: 10,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (value) {
        _address = value!;
      },
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();

    void onSubmit() {}

    return SingleChildScrollView(
      child: Column(
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
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        LocationFieldsForm(
                            countryState: _countryState,
                            address: _address,
                            numberAddress: _numberAddress,
                            zipCode: _zipCode),
                        InfoPropertyFieldsForm(
                            firstPhone: _firstPhone,
                            secondaryPhone: _secondaryPhone,
                            tower: _tower,
                            floor: _floor,
                            doorNumber: _doorNumber,
                            contactName: _contactName
                        ),
                        /*
                        _buildAddress(),*/
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              child: RaisedButton(
                                color: Colors.green,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Scaffold.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text('Processing Data')));
                                    print(_address);
                                  }
                                },
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.green)),
                              ),
                            )),
                      ],
                    )),
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
                        onPressed: () => onSubmit(),
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
