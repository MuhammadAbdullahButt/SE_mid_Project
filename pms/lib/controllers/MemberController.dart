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


  static  Future<List<Map<String, dynamic>>> getMembers() async {
    var url = Uri.parse('${Configuration.apiBaseUrl}user/members');
    List<Map<String, dynamic>> membersList = []; // List of maps
    try {
      final response = await http.get(url);
      if (response.statusCode == 201) {
        var productResponse = json.decode(response.body);
        productResponse.forEach((result) {
          membersList.add({
            "user_id":result['user_id']['_id'],
            "role":result['user_id']['role'],
            "name": result['name'],
            "DOB": result['type'],
            "CNIC": result['description'],
            "description": result['cost'],
            "skills": result['status'],
          });
        });
      }
    } catch (error) {
      print(error);
    }
    return membersList;
  }

}