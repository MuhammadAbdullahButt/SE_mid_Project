import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pms/configurations.dart';

class MemberController extends GetxController
{

  static Future<void> addTask(Map memberData) async {
    var url = Uri.parse('${Configuration.apiBaseUrl}team/create');
    try {
      final response = await http.post(url, body: memberData);
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

  // this function will return list of Maps of all members
  static  Future<List<Map<String, dynamic>>> getMembers() async {
    var url = Uri.parse('${Configuration.apiBaseUrl}user/members');
    List<Map<String, dynamic>> membersList = []; // List of maps
    try {
      final response = await http.get(url);
      if (response.statusCode == 201) {
        var productResponse = json.decode(response.body);
        productResponse.forEach((result) {
          if(result['user_id']['role'] != 'admin') {
            membersList.add({
              "user_id": result['user_id']['_id'],
              "role": result['user_id']['role'],
              "name": result['name'],
              "DOB": result['type'],
              "CNIC": result['description'],
              "description": result['cost'],
              "skills": result['status'],
            });
          }
        });
      }
    } catch (error) {
      print(error);
    }
    return membersList;
  }

  // this function will return list of Maps of all project manager
  static  Future<List<Map<String, dynamic>>> getProjectManagers() async {
    var url = Uri.parse('${Configuration.apiBaseUrl}user/pm');
    List<Map<String, dynamic>> pmList = [];
    try {
      final response = await http.get(url);
      if (response.statusCode == 201) {
        var productResponse = json.decode(response.body);
        productResponse.forEach((result) {
            pmList.add({
              "user_id": result['user_id']['_id'],
              "role": result['user_id']['role'],
              "name": result['name'],
              "DOB": result['type'],
              "CNIC": result['description'],
            });
        });
      }
    } catch (error) {
      print(error);
    }
    return pmList;
  }

}