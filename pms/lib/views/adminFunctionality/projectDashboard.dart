import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pms/controllers/ProjectController.dart';
import 'package:pms/views/PMDashboard/taskCreation.dart';
import 'package:pms/views/adminDashboard.dart';

import '../../controllers/TaskController.dart';

class ProjectDashboard extends StatefulWidget {

  final Map project;
  const ProjectDashboard({
    Key? key,
    required this.project,
  }) : super(key: key);
  @override
  State<ProjectDashboard> createState() => _ProjectDashboardState(project);
}

class _ProjectDashboardState extends State<ProjectDashboard> {
  final Map project;
  _ProjectDashboardState(this.project);

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
        title: Center(child: Text(project['name'],style: TextStyle(fontSize: 30,color: Colors.white,fontFamily: 'playFairItalic'),)),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Text('Deadline: '+ project['deadLine'],style: TextStyle(color: Colors.red,fontSize: 17,fontFamily: 'playFair'),),
            const SizedBox(height: 10,),
            const Text('Est Cost: 500',style: TextStyle(color: Colors.green,fontSize: 17,fontFamily: 'playFair'),),
            const SizedBox(height: 10,),
            Text('Status: '+ project['status'],style: TextStyle(color: Colors.black87,fontSize: 17,fontFamily: 'playFair'),),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  ProjectController.deleteProject(project['id']);
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return AdminDashboard();
                  }));

                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black87,
                ),
                child: const Text('Delete Project',style: TextStyle(color: Colors.white,fontFamily: 'playFair'),)
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: DefaultTabController(
                length: 1,
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white24,
                    bottom: const TabBar(
                      tabs: [
                        Tab(
                          text: 'Current Tasks',
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      Container(
                        child: Expanded(
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: TaskController.getTasksbyProjectId(project['id']),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Loading indicator while waiting for data
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      // Handle error state
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      // Data has been received, build the ListView.builder
                      List<Map<String, dynamic>> taskList = snapshot.data!;

                      return ListView.builder(
                        itemCount: taskList.length,
                        itemBuilder: (context, index) {
                          var task = taskList[index];
                          return Container(
                            margin: EdgeInsets.only(top: 8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                              ),
                            ),
                            child: ListTile(
                              title: Text(task['title'] ?? 'No Title'),
                              subtitle: Text(task['description'] ?? 'No Description'),
                              // Add more fields as needed
                            ),
                          );
                        },
                      );
                    }
                  },
                  ),
                  )
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }}
