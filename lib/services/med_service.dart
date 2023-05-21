import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medical_data/models/medicines.dart';

class MedicalService {
  var url = Uri.parse('http://10.0.2.2:1337/api/medicines');

  var header = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8'
  };

  Future<List<Medicines>> getMedicines() async {
    List<Medicines> list;
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)["data"] as List;
      list = data.map<Medicines>((json) => Medicines.fromJson(json)).toList();
      return list;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Medicines> createMedicines(
    String name,
    String chName,
    String madeIn,
    String pack,
    String perBox,
    String regulatory,
    String price,
    String category,
    String tags,
    String img,
  ) async {
    final response = await http.post(
      url,
      headers: header,
      body: jsonEncode(
        {
          'data': {
            'name': name,
            'chName': chName,
            'madeIn': madeIn,
            'pack': pack,
            'perBox': perBox,
            'regulatory': regulatory,
            'price': price,
            'category': category,
            'tags': tags,
            'img': img
          }
        },
      ),
    );
    // print(response.statusCode);
    if (response.statusCode == 200) {
      // print("create");
      final data = Medicines.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes))["data"]);
      print(data);
      return data;
    } else {
      throw Exception("Fail to load items");
    }
  }
}
