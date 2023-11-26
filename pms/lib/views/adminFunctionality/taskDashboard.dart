import 'package:flutter/material.dart';
import 'package:pms/controllers/CommentController.dart';

class TaskDashboard extends StatefulWidget {
  final Map task;
  const TaskDashboard({super.key,required this.task});
  @override
  State<TaskDashboard> createState() => _TaskDashboardState(task: task);
}

class _TaskDashboardState extends State<TaskDashboard> {
  Map task;
  _TaskDashboardState({required this.task});
  TextEditingController commentController = TextEditingController();
  List<String> comments = [
    'Great progress!',
    'Keep up the good work!',
    'Any challenges you are facing?',
  ];

  void _showCommentsBottomSheet(BuildContext context) {
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
                          subtitle: Text(comments[index]),
                          title: const Text('Muhammad Waseem'),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          // Add the new comment to the list
                          setState(() {
                            Map comment = {
                              "task_id":"0jj08989",
                              "author_name":"Muhammad Waseem",
                              "text":commentController.text,
                            };
                            CommentController.addComment(comment);
                            comments.add(commentController.text);
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
            const SizedBox(height: 30,),
            const ListTile(
              leading: Icon(Icons.people),
              title: Text('Team 1'),
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
                onPressed: (){
                  _showCommentsBottomSheet(context);
                },
                child: const Text('View Comments'))
          ],
        ),
      ),
    );
  }}
