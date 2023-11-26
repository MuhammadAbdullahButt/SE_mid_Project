import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../configurations.dart';

class SignUpInController {
  static Future<void> addMember(Map member) async {
    print(member);
    var url = Uri.parse('${Configuration.apiBaseUrl}signup/member');
    try {
      final response = await http.post(url, body: member);
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

  static Future<void> addPM(Map PM) async {
    print('add PM called');
    var url = Uri.parse('${Configuration.apiBaseUrl}signup/pm');
    try {
      final response = await http.post(url, body: PM);
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


  static Future<Map> Login(Map data) async {
    Map m = {"error":"error"};
    var url = Uri.parse('${Configuration.apiBaseUrl}login/user');
    try {
      final response = await http.post(url, body: data);
      if (response.statusCode == 200) {
          var responseData = json.decode(response.body);
          Map userData = responseData['data'];
          userData['role'] = responseData['role'];
          print(userData);
          return userData;
      }
    } catch (error) {
      print(error);
    }
    return m;
  }


}