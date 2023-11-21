import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TeamController extends GetxController
{
  static const apiBaseUrl = 'http://192.168.1.17:3005/';
  static Future<void> addTask(Map teamData) async {
    var url = Uri.parse('${apiBaseUrl}team/create');
    try {
      final response = await http.post(url, body: teamData);
      if (response.statusCode == 200) {
        print(json.decode(response.body));

        var r = json.decode(response.body);
        print(r['code']);
        Get.back();
      }
    } catch (error) {
      print(error);
    }
  }


  static  Future<List<Map<String, dynamic>>> getTeams() async {
    var url = Uri.parse('${apiBaseUrl}task/view');
    List<Map<String, dynamic>> teamsList = []; // List of maps
    try {
      final response = await http.get(url);
      if (response.statusCode == 201) {
        var productResponse = json.decode(response.body);
        productResponse.forEach((result) {
          teamsList.add({
            "title": result['name'],
            "description": result['type'],
            "priority": result['description'],
            "status": result['cost'],
            "deadLine": result['status'],
          });
        });
      }
    } catch (error) {
      print(error);
    }
    return teamsList;
  }

}