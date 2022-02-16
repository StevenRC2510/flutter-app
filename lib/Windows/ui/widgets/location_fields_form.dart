import 'package:flutter/material.dart';

import 'package:hermes_app/widgets/dropdown.dart';
import 'package:hermes_app/widgets/text_input.dart';
import 'package:hermes_app/widgets/text_form_input.dart';

class LocationFieldsForm extends StatelessWidget {
  final String countryState;
  final String address;
  final String numberAddress;
  final String zipCode;

  const LocationFieldsForm({
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

    return Column(children: [
      TextFormInput(
          label: "Dirección del inmueble",
          error: "Digite la dirección del inmueble",
          field: address),
      TextInput(
        label: "Dirección del inmueble",
        hintText: "ingresa la dirección del inmueble",
        inputType: TextInputType.text,
        maxLines: 1,
        controller: _controllerTitlePlace,
      ),
    ]);
  }

  Widget _buildNumberAddress() {
    final _controllerTitlePlace = TextEditingController();

    return Column(children: [
      TextFormInput(
          label: "Número de calle",
          error: "Digite el número de calle del inmueble",
          keyboardType: TextInputType.streetAddress,
          field: numberAddress),
      TextInput(
        label: "Número de calle",
        hintText: "Digite el número de calle del inmueble",
        inputType: TextInputType.text,
        maxLines: 1,
        controller: _controllerTitlePlace,
      ),
    ]);
  }

  Widget _buildZipCode() {
    final _controllerTitlePlace = TextEditingController();

    return Column(children: [
      TextFormInput(
          label: "Código Postal",
          error: "Digite el código postal",
          keyboardType: TextInputType.number,
          field: zipCode),
      TextInput(
        label: "Código Postal",
        hintText: "Digite el código postal",
        inputType: TextInputType.text,
        maxLines: 1,
        controller: _controllerTitlePlace,
      ),
    ]);
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
