import 'dart:convert';
import 'package:get/get.dart';
import '../configurations.dart';
import 'package:http/http.dart' as http;

class CommentController extends GetxController{
  static const apiBaseUrl = 'http://192.168.1.17:3005/';
  static Future<void> addComment(Map Comment)
  async {
    var url = Uri.parse('${Configuration.apiBaseUrl}comment/create');
    try {
      final response = await http.post(url, body: Comment);
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
  static Future<List<Map<String, dynamic>>> getComments(String taskId)
  async {
    var url = Uri.parse('${Configuration.apiBaseUrl}comment/view');
    List<Map<String, dynamic>> commentList = [];
    try {
      final response = await http.get(url);
      if (response.statusCode == 201) {
        var commentResponse = json.decode(response.body);
        commentResponse.forEach((result) {
          if(result['task_id'] == taskId) {
            commentList.add({
              "task_id": result['task_id'],
              "author_name": result['author_name'],
              "text": result['text']
            });
          }
        });
      }
    } catch (error) {
      print(error);
    }
    print(commentList);
    return commentList;

  }

}