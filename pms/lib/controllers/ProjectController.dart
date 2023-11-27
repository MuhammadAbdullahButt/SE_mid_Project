import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../configurations.dart';

class ProjectController extends GetxController
{
  static const apiBaseUrl = 'http://192.168.1.17:3005/';
  static Future<void> addProject(Map projectData) async {
    var url = Uri.parse('${Configuration.apiBaseUrl}project/create');
    try {
      final response = await http.post(url, body: projectData);
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


  static  Future<List<Map<String, dynamic>>> getProject() async {
    var url = Uri.parse('${Configuration.apiBaseUrl}project/view');
    List<Map<String, dynamic>> productList = []; // List of maps
    try {
      final response = await http.get(url);
      if (response.statusCode == 201) {
        var productResponse = json.decode(response.body);
        productResponse.forEach((result) {
          productList.add({
            "id": result['_id'],
            "name": result['name'],
            "type": result['type'],
            "description": result['description'],
            "cost": result['cost'],
            "status": result['status'],
            "repoLink": result['repoLink'],
            "deadLine": result['deadLine'],
          });
        });
      }
    } catch (error) {
      print(error);
    }
    return productList;
  }


  static  Future<List<Map<String, dynamic>>> getProjectByPmId(String id) async {
    var url = Uri.parse('${Configuration.apiBaseUrl}project/getbypmid/'+id);
    List<Map<String, dynamic>> projectList = []; // List of maps
    try {
      final response = await http.get(url);
      if (response.statusCode == 201) {
        var productResponse = json.decode(response.body);
        productResponse.forEach((result) {
          projectList.add({
            "id": result['_id'],
            "name": result['name'],
            "type": result['type'],
            "description": result['description'],
            "cost": result['cost'],
            "status": result['status'],
            "repoLink": result['repoLink'],
            "deadLine": result['deadLine'],
          });
        });
      }
    } catch (error) {
      print(error);
    }
    return projectList;
  }

}