import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:worm/model/sceduleModel.dart';

class SceduleService {
  static const String _baseUrl = 'http://10.0.2.2:8000/api/';

  var tokenData = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Accept': "application/json"
  };

  Future<Scedule> getAllSchedule() async {
    final response = await http.get(Uri.parse(_baseUrl + "scedule"));
    if (response.statusCode == 200) {
      return Scedule.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<bool> createSchedule(Map<String, dynamic> body) async {
    final response = await http.post(Uri.parse(_baseUrl + "scedules"),
        body: body, headers: tokenData);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteSchedule(int id) async {
    final response = await http.delete(
        Uri.parse(_baseUrl + "scedules/" + id.toString()),
        headers: tokenData);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateSchedule(Map<String, dynamic> body, int id) async {
    final response = await http.put(
        Uri.parse(_baseUrl + "scedules/" + id.toString()),
        body: body,
        headers: tokenData);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
