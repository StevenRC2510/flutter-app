import 'package:flutter/material.dart';

import 'package:hermes_app/widgets/dropdown.dart';
import 'package:hermes_app/widgets/text_input.dart';
import 'package:hermes_app/widgets/text_form_input.dart';

class LocationFieldsForm extends StatelessWidget {
  // final String countryState;
  // final String address;
  // final String numberAddress;
  // final String zipCode;

  // final _controllerAddress = TextEditingController();
  // final _controllerNumberAddress = TextEditingController();
  // final _controllerZipCode = TextEditingController();

  final TextEditingController controllerAddress;
  final TextEditingController controllerNumberAddress;
  final TextEditingController controllerZipCode;

  LocationFieldsForm({
    Key? key,
    required this.controllerAddress,
    required this.controllerNumberAddress,
    required this.controllerZipCode,
    // required this.countryState,
    // required this.address,
    // required this.numberAddress,
    // required this.zipCode,
  }) : super(key: key);

  Widget _buildCountryState() {
    return Column(children: const [
      Dropdown(label: "Estado"),
    ]);
  }

  Widget _buildAddress() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormInput(
          label: "Dirección del inmueble",
          error: "Digite la dirección del inmueble",
          controller: controllerAddress),
    );
  }

  Widget _buildNumberAddress() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormInput(
          label: "Número de calle",
          error: "Digite el número de calle del inmueble",
          keyboardType: TextInputType.streetAddress,
          controller: controllerNumberAddress),
    );
  }

  Widget _buildZipCode() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormInput(
          label: "Código Postal",
          error: "Digite el código postal",
          keyboardType: TextInputType.number,
          controller: controllerZipCode),
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
