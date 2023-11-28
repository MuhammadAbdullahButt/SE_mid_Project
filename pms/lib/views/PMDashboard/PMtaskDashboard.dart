import 'package:flutter/material.dart';
import 'package:pms/controllers/CommentController.dart';
import 'package:pms/controllers/TaskController.dart';

import '../PMDashboard/ProjectManagerDashboard.dart';

class PMTaskDashboard extends StatefulWidget {
  final Map user;
  final Map task;
  const PMTaskDashboard({super.key,required this.task,required this.user});
  @override
  State<PMTaskDashboard> createState() => _TaskDashboardState(task: task,user: user);
}

class _TaskDashboardState extends State<PMTaskDashboard> {
  Map task;
  Map user;
  _TaskDashboardState({required this.task, required this.user});
  TextEditingController commentController = TextEditingController();


  void _showCommentsBottomSheet(BuildContext context,List<Map<String, dynamic>> comments) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Comments',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'playFair'
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: const Icon(Icons.comment),
                          title: Text(comments[index]['author_name']),
                          subtitle: Text(comments[index]['text']),
                        );
                      },
                    )
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          // Add the new comment to the list
                          setState(() {
                            Map comment = {
                              "task_id":task['id'],
                              "author_name":user['name'],
                              "text":commentController.text,
                            };
                            CommentController.addComment(comment);
                            commentController.clear();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 170,
        backgroundColor: Colors.black87,
        shadowColor: Colors.black87,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        title: Center(child: Text(task['title'],style: TextStyle(fontSize: 30,color: Colors.white,fontFamily: 'playFairItalic'),)),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Text('Deadline: ${task['deadline']}',style: const TextStyle(color: Colors.red,fontSize: 17,fontFamily: 'playFair'),),
            const SizedBox(height: 10,),
            Text('Priority: '+task['priority'],style: TextStyle(color: Colors.green,fontSize: 17,fontFamily: 'playFair'),),
            const SizedBox(height: 10,),
            Text('Status: '+task['status'],style: TextStyle(color: Colors.black87,fontSize: 17,fontFamily: 'playFair'),),
            const SizedBox(height: 10,),
            Text('Description: '+task['description'],style: TextStyle(color: Colors.black87,fontSize: 17,fontFamily: 'playFair'),),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  TaskController.deleteTask(task['id']);
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return PMDashboard(projectManager: user,);
                  }));

                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black87,
                ),
                child: const Text('Delete Task',style: TextStyle(color: Colors.white,fontFamily: 'playFair'),)
            ),
            const SizedBox(height: 30,),
            const ListTile(
              leading: Icon(Icons.people),
              title: Text('Team 1'),
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
                onPressed: () async {
                  List<Map<String, dynamic>> comments = await CommentController.getComments(task['id']);
                  _showCommentsBottomSheet(context,comments);
                },
                child: const Text('View Comments'))
          ],
        ),
      ),
    );
  }}
