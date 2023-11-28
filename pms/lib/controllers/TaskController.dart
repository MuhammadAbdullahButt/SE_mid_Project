import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../configurations.dart';

class TaskController extends GetxController
{
  static Future<void> addTask(Map taskData) async {
    var url = Uri.parse('${Configuration.apiBaseUrl}task/create');
    try {
      final response = await http.post(url, body: taskData);
      if (response.statusCode == 201) {
        print(json.decode(response.body));

        var r = json.decode(response.body);
        print(r['code']);
        Get.back();
      }
    } catch (error) {
      print(error);
    }
  }


  static  Future<List<Map<String, dynamic>>> getTasks() async {
    var url = Uri.parse('${Configuration.apiBaseUrl}task/view');
    List<Map<String, dynamic>> taskList = []; // List of maps
    try {
      final response = await http.get(url);
      if (response.statusCode == 201) {
        var productResponse = json.decode(response.body);
        productResponse.forEach((result) {
          taskList.add({
            "id": result['_id'],
            "project_id": result['Project_id'],
            "title": result['title'],
            "description": result['description'],
            "priority": result['priority'],
            "status": result['status'],
            "deadline": result['deadLine'],
            "assignedTeam_id": result['assignedTeam_id'],
          });
        });
      }
    } catch (error) {
      print(error);
    }
    return taskList;
  }



  static  Future<List<Map<String, dynamic>>> getTasksByMemberId(var id) async {
    var url = Uri.parse('${Configuration.apiBaseUrl}task/gettasksbymember/'+id.toString());
    List<Map<String, dynamic>> taskList = []; // List of maps
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var productResponse = json.decode(response.body);
        productResponse.forEach((result) {
          taskList.add({
            "id": result['_id'],
            "project_id": result['Project_id'],
            "title": result['title'],
            "description": result['description'],
            "priority": result['priority'],
            "status": result['status'],
            "deadline": result['deadLine'],
            "assignedTeam_id": result['assignedTeam_id'],
          });
        });
      }
    } catch (error) {
      print(error);
    }
    return taskList;
  }



  static  Future<List<Map<String, dynamic>>> getTasksbyProjectId(String id) async {
    var url = Uri.parse('${Configuration.apiBaseUrl}task/view');
    List<Map<String, dynamic>> taskList = []; // List of maps
    try {
      final response = await http.get(url);
      if (response.statusCode == 201) {
        var productResponse = json.decode(response.body);
        productResponse.forEach((result) {
          if(id == result['Project_id']) {
            taskList.add({
              "id": "_id",
              "project_id": result['Project_id'],
              "title": result['title'],
              "description": result['description'],
              "priority": result['priority'],
              "status": result['status'],
              "deadline": result['deadLine'],
              "assignedTeam_id": result['assignedTeam_id'],
            });
          }
        });
      }
    } catch (error) {
      print(error);
    }
    return taskList;
  }


  static Future<void> deleteTask(String task_id) async {
    var url = Uri.parse('${Configuration.apiBaseUrl}task/delete/'+task_id);
    try {
      final response = await http.delete(url);
      if (response.statusCode == 200) {
        print('Task deleted successfully');
        Get.back();
      } else {
        print('Failed to delete Task. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error deleting Task: $error');
    }
  }

}