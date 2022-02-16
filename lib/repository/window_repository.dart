import 'dart:convert';

import 'package:hermes_app/utils/constants.dart';

abstract class WindowRepositoryBase {
  Future getProperties();
  Future createProperty();
}

class WindowRepository with WindowRepositoryBase {
  @override
  Future<dynamic> getProperties() async {
    print('execute');
    dynamic response = [];
    try {
      final url = Uri.parse(API_URL + '/get_property_list');
      final data = await client.post(
        url,
        headers: {'x-api-key': X_API_KEY},
        body: jsonEncode({
          "role": "ventanero",
          "userId": "110171288108622542163",
          "pagination": {"page": "1", "items": "10"},
          "filters": {
            "address": "",
            "date": "",
            "user": "",
            "phone": "",
            "status": "",
            "source_id": "",
            "nid": "",
            "city": ""
          }
        }),
      );
      response = json.decode(data.body)['data'];
      print(json.decode(data.body)['data']);
      // print(jsonDecode(utf8.decode(response.bodyBytes)) as Map);
    } catch (e) {
      print(e);
    }
    return response;
  }

  @override
  Future<dynamic> createProperty() async {
    print('execute');
    dynamic response = [];
    try {
      final url = Uri.parse(API_URL + '/post_ventanero');
      final data = await client.post(
        url,
        headers: {'x-api-key': X_API_KEY},
        body: jsonEncode({
          "entry": "sendform",
          "country": "MX",
          "name_real_estate": "Prueba Steven 2",
          "property_number": "",
          "tower": "",
          "phone_1": "",
          "phone": "56516516",
          "department_set": "Rancho Cosolapa 133",
          "suburb": "Campestre Coyoacán",
          "delegation": "Coyoacán",
          "longitude": -74.1685872,
          "latitude": 4.6509262,
          "zip_code": "04929",
          "street_number": "133",
          "address": "Rancho Cosalapa",
          "mex_state": "CMX",
          "available_apt": true,
          "state": "suficiente",
          "user": "genesistaborda@habi.co",
          "role": "ventanero",
          "images": [
            {
              "file":
                  "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",
              "extension": "png",
              "description": "PORTERIA"
            }
          ],
          "source": "Ventana",
          "source_id": 1
        }),
      );
      response = json.decode(data.body)['data'];
      print(response);
      // print(jsonDecode(utf8.decode(response.bodyBytes)) as Map);
    } catch (e) {
      print(e);
    }
    return response;
  }
}
