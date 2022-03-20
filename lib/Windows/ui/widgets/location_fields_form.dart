import 'package:flutter/material.dart';

import 'package:hermes_app/widgets/dropdown.dart';
import 'package:hermes_app/widgets/text_input.dart';
import 'package:hermes_app/widgets/text_form_input.dart';

class LocationFieldsForm extends StatelessWidget {
  final String countryState;
  final String address;
  final String numberAddress;
  final String zipCode;

  final _controllerAddress = TextEditingController();
  final _controllerNumberAddress = TextEditingController();
  final _controllerZipCode = TextEditingController();

  LocationFieldsForm({
    Key? key,
    required this.countryState,
    required this.address,
    required this.numberAddress,
    required this.zipCode,
  }) : super(key: key);

  Widget _buildCountryState() {
    return Column(children: const [
      Dropdown(label: "Estado"),
    ]);
  }

  Widget _buildAddress() {
    final _controllerTitlePlace = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormInput(
          label: "Dirección del inmueble",
          error: "Digite la dirección del inmueble",
          controller: _controllerAddress),
      /*
      TextInput(
        label: "Dirección del inmueble",
        hintText: "ingresa la dirección del inmueble",
        inputType: TextInputType.text,
        maxLines: 1,
        controller: _controllerTitlePlace,
      ),*/
    );
  }

  Widget _buildNumberAddress() {
    final _controllerTitlePlace = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormInput(
          label: "Número de calle",
          error: "Digite el número de calle del inmueble",
          keyboardType: TextInputType.streetAddress,
          controller: _controllerNumberAddress),
      /*
      TextInput(
        label: "Número de calle",
        hintText: "Digite el número de calle del inmueble",
        inputType: TextInputType.text,
        maxLines: 1,
        controller: _controllerTitlePlace,
      ),*/
    );
  }

  Widget _buildZipCode() {
    final _controllerTitlePlace = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormInput(
          label: "Código Postal",
          error: "Digite el código postal",
          keyboardType: TextInputType.number,
          controller: _controllerZipCode),
      /*
      TextInput(
        label: "Código Postal",
        hintText: "Digite el código postal",
        inputType: TextInputType.text,
        maxLines: 1,
        controller: _controllerTitlePlace,
      ),*/
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCountryState(),
        _buildAddress(),
        _buildNumberAddress(),
        _buildZipCode(),
      ],
    );
  }
}
