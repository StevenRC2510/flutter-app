import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:hermes_app/widgets/dropdown.dart';
import 'package:hermes_app/widgets/text_input.dart';
import 'package:hermes_app/widgets/text_form_input.dart';
import 'package:hermes_app/User/ui/widgets/circle_button.dart';

class InfoPropertyFieldsForm extends StatelessWidget {
  final String firstPhone;
  final String secondaryPhone;
  final String tower;
  final String floor;
  final String doorNumber;
  final String contactName;

  const InfoPropertyFieldsForm({
    Key? key,
    required this.firstPhone,
    this.secondaryPhone = "",
    this.tower = "",
    this.floor = "",
    this.doorNumber = "",
    this.contactName = "",
  }) : super(key: key);

  Future<void> pickImage({type = "gallery"}) async {
    final ImagePicker _picker = ImagePicker();
    final sourceType =
        type == "camera" ? ImageSource.camera : ImageSource.gallery;
    final image = await _picker.pickImage(source: sourceType);
  }

  Widget _buildFirstPhone() {
    final _controllerTitlePlace = TextEditingController();

    return Column(children: [
      TextFormInput(
          label: "Teléfono", error: "Digite el Teléfono", field: firstPhone),
      TextInput(
        label: "Teléfono",
        hintText: "Digite el Teléfono",
        inputType: TextInputType.text,
        maxLines: 1,
        controller: _controllerTitlePlace,
      ),
    ]);
  }

  Widget _buildSecondaryPhone() {
    final _controllerTitlePlace = TextEditingController();

    return Column(children: [
      TextFormInput(
          label: "Teléfono secundario", error: "", field: secondaryPhone),
      TextInput(
        label: "Teléfono secundario",
        hintText: "ingresa el Teléfono secundario",
        inputType: TextInputType.text,
        maxLines: 1,
        controller: _controllerTitlePlace,
      ),
    ]);
  }

  Widget _buildTower() {
    final _controllerTitlePlace = TextEditingController();

    return Column(children: [
      TextFormInput(label: "Interior/Torre", error: "", field: tower),
      TextInput(
        label: "Interior/Torre",
        hintText: "Digite el interior/torre",
        inputType: TextInputType.text,
        maxLines: 1,
        controller: _controllerTitlePlace,
      ),
    ]);
  }

  Widget _buildFloor() {
    return Column(children: const [
      Dropdown(label: "Número de piso"),
    ]);
  }

  Widget _buildDoorNumber() {
    final _controllerTitlePlace = TextEditingController();

    return Column(children: [
      TextFormInput(label: "Número del inmueble", error: "", field: doorNumber),
      TextInput(
        label: "Número del inmueble",
        hintText: "Digite el número del inmueble",
        inputType: TextInputType.text,
        maxLines: 1,
        controller: _controllerTitlePlace,
      ),
    ]);
  }

  Widget _buildContactName() {
    final _controllerTitlePlace = TextEditingController();

    return Column(children: [
      TextFormInput(
          label: "Nombre del contacto", error: "", field: contactName),
      TextInput(
        label: "Nombre del contacto",
        hintText: "Digite el nombre del contacto",
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
        _buildFirstPhone(),
        _buildSecondaryPhone(),
        _buildTower(),
        _buildFloor(),
        _buildDoorNumber(),
        _buildContactName(),
        Row(
          children: [
            CircleButton(
              onPressed: () {
                pickImage(type: "camera");
              },
              mini: true,
              icon: Icons.camera,
              iconSize: 20.0,
              color: const Color.fromRGBO(255, 255, 255, 0.6),
            ),
            CircleButton(
              onPressed: () {
                pickImage();
              },
              mini: true,
              icon: Icons.image,
              iconSize: 20.0,
              color: const Color.fromRGBO(255, 255, 255, 0.6),
            ),
          ],
        )
      ],
    );
  }
}
