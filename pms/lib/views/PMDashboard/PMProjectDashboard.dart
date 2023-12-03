import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pms/views/PMDashboard/taskCreation.dart';

import '../../controllers/TaskController.dart';

class PMProjectDashboard extends StatefulWidget {

  final Map project;
  final Map PM;
  const PMProjectDashboard({
    Key? key,
    required this.project,
    required this.PM,
  }) : super(key: key);
  @override
  State<PMProjectDashboard> createState() => _PMProjectDashboardState(project,PM);
}

class _PMProjectDashboardState extends State<PMProjectDashboard> {
  final Map project;
  final Map PM;
  _PMProjectDashboardState(this.project, this.PM);

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
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return TaskCreation(project: project, PM: PM,);
                  }));

                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black87,
                ),
                child: const Text('Create Task',style: TextStyle(color: Colors.white,fontFamily: 'playFair'),)
            ),
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
