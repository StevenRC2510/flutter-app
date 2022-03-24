import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:hermes_app/widgets/dropdown.dart';
import 'package:hermes_app/widgets/text_input.dart';
import 'package:hermes_app/widgets/text_form_input.dart';
import 'package:hermes_app/User/ui/widgets/circle_button.dart';

class InfoPropertyFieldsForm extends StatefulWidget {
  // final String firstPhone;
  // final String secondaryPhone;
  // final String tower;
  // final String floor;
  // final String doorNumber;
  // final String contactName;

  final TextEditingController controllerFirstPhone;
  final TextEditingController controllerSecondaryPhone;
  final TextEditingController controllerTower;
  final TextEditingController controllerFloor;
  final TextEditingController controllerDoorNumber;
  final TextEditingController controllerContactName;

  const InfoPropertyFieldsForm({
    Key? key,
    required this.controllerFirstPhone,
    required this.controllerSecondaryPhone,
    required this.controllerTower,
    required this.controllerFloor,
    required this.controllerDoorNumber,
    required this.controllerContactName,
  }) : super(key: key);
  @override
  _InfoPropertyFieldsForm createState() {
    return _InfoPropertyFieldsForm();
  }
}

class _InfoPropertyFieldsForm extends State<InfoPropertyFieldsForm> {
  bool _expanded = false;
  // final _controllerPhone = TextEditingController();
  // final _controllerSecondaryPhone = TextEditingController();
  // final _controllerTower = TextEditingController();
  // final _controllerDoorNumber = TextEditingController();
  // final _controllerContactName = TextEditingController();

/*class InfoPropertyFieldsForm extends StatelessWidget {*/
  /*final String firstPhone;
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
  }) : super(key: key);*/

  Future<void> pickImage({type = "gallery"}) async {
    final ImagePicker _picker = ImagePicker();
    final sourceType =
        type == "camera" ? ImageSource.camera : ImageSource.gallery;
    final image = await _picker.pickImage(source: sourceType);
  }

  Widget _buildFirstPhone() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormInput(
        label: "Teléfono",
        error: "Digite el Teléfono",
        controller: widget.controllerFirstPhone,
      ),
    );
  }

  Widget _buildSecondaryPhone() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormInput(
          label: "Teléfono secundario",
          error: "",
          controller: widget.controllerSecondaryPhone),
    );
  }

  Widget _buildTower() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormInput(
          label: "Interior/Torre",
          error: "",
          controller: widget.controllerTower),
    );
  }

  Widget _buildFloor() {
    return const Padding(
      padding: const EdgeInsets.all(10),
      child: Dropdown(label: "Número de piso"),
    );
  }

  Widget _buildDoorNumber() {
    final _controllerTitlePlace = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormInput(
          label: "Número del inmueble",
          error: "",
          controller: widget.controllerDoorNumber),
    );
  }

  Widget _buildContactName() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormInput(
          label: "Nombre del contacto",
          error: "",
          controller: widget.controllerContactName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(top: 10),
        child: ExpansionPanelList(
          animationDuration: const Duration(milliseconds: 1000),
          children: [
            ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return const ListTile(
                  title: Text(
                    "Datos de la propiedad",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: "Monserrat",
                        color: Color(0xFF252129),
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
              body: Column(
                children: [
                  _buildFirstPhone(),
                  _buildSecondaryPhone(),
                  _buildTower(),
                  _buildFloor(),
                  _buildDoorNumber(),
                  _buildContactName(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      children: [
                        /*
                      CircleButton(
                        onPressed: () {
                          pickImage(type: "camera");
                        },
                        mini: true,
                        icon: Icons.camera,
                        iconSize: 20.0,
                        color: const Color.fromRGBO(255, 255, 255, 0.6),
                      ),*/
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
                    ),
                  ),
                ],
              ),
              isExpanded: _expanded,
              canTapOnHeader: true,
            ),
          ],
          dividerColor: Colors.grey,
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
              _expanded = !_expanded;
            });
          },
        ),
      ),
    ]);
  }
}

/*Column(
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
);*/
