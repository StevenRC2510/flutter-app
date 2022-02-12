import 'dart:convert';

import 'package:hermes_app/utils/constants.dart';

abstract class WindowRepositoryBase {
  Future getProperties();
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
}
