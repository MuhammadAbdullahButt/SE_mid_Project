import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../controllers/ProjectController.dart';
import '../../controllers/TaskController.dart';
import '../../controllers/TeamController.dart';
import '../LoginSc.dart';
import '../adminFunctionality/taskDashboard.dart';
import '../adminFunctionality/teamDashboard.dart';
import 'PMProjectDashboard.dart';

class PMDashboard extends StatefulWidget {
  final Map projectManager;
  const PMDashboard({super.key, required this.projectManager});
  @override
  State<PMDashboard> createState() => _PMDashboardState(projectManager: projectManager);
}

class _PMDashboardState extends State<PMDashboard> {
  Map projectManager;
  _PMDashboardState({required this.projectManager});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.black87,
        shadowColor: Colors.black87,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Center(child: Text('PMS',style: TextStyle(color: Colors.white,fontFamily: 'playFairItalic'),)),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black87),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                  ),
                  Text(projectManager['name'].toString(),style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'playFair'),),
                  Text(projectManager['username'].toString(),style: TextStyle(color: Colors.white,fontSize: 13,fontFamily: 'playFair'),),
                ],
              ),

            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return const LoginSc();
                }));
              },
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white24,
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Projects',
                ),
                Tab(
                  text: 'Tasks',
                ),
                Tab(
                  text: 'Teams',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                child: Stack(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 6.0,right: 6.0),
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                              future: ProjectController.getProjectByPmId(projectManager['user_id'].toString()),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('Error: ${snapshot.error}'),
                                  );
                                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                  return const Center(
                                    child: Text('No projects available.'),
                                  );
                                }
                                else {
                                  List<Map<String, dynamic>> projectList = snapshot.data!;
                                  return ListView.builder(
                                      itemCount: projectList.length,
                                      itemBuilder: (context, index) {
                                        Map<String, dynamic> project = projectList[index];
                                        return Padding(
                                          padding: const EdgeInsets.only(top: 3),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(
                                                  builder: (context) {
                                                    return PMProjectDashboard(project: project);
                                                  }));
                                            },
                                            child: Container(
                                                width: 320,
                                                height: 130,
                                                decoration: BoxDecoration(
                                                  color: Colors.black87,
                                                  borderRadius: BorderRadius.circular(25),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                        alignment: Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsets.only(left: 12.0, top: 20),
                                                          child: Text(
                                                            project['name'],
                                                            style: const TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20,
                                                                fontFamily: 'playFair'),
                                                          ),
                                                        )),
                                                    Align(
                                                        alignment: Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsets.only(left: 12.0, top: 50),
                                                          child: Text( 'type: '+
                                                              project['type'],
                                                            style: const TextStyle(
                                                                color: Colors.greenAccent,
                                                                fontSize: 14,
                                                                fontFamily: 'playFair'),
                                                          ),
                                                        )),
                                                    Align(
                                                        alignment: Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsets.only(left: 12.0, top: 85),
                                                          child: Text(
                                                            'Status: '+ project['status'],
                                                            style: TextStyle(
                                                                color: Colors.redAccent,
                                                                fontSize: 14,
                                                                fontFamily: 'playFair'),
                                                          ),
                                                        )),
                                                    Align(
                                                      alignment: Alignment.bottomRight,
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsets.only(bottom: 8.0, right: 8.0),
                                                        child: Icon(
                                                          Icons.open_in_new,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        );
                                      });
                                }
                              })
                      ),
                    ]
                ),
              ),
              Container(
                child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0,right: 6.0),
                        child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: TaskController.getTasks(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}'),
                                );
                              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                return const Center(
                                  child: Text('No Tasks available.'),
                                );
                              }
                              else {
                                List<Map<String, dynamic>> taskList = snapshot.data!;
                                return ListView.builder(
                                    itemCount: taskList.length,
                                    itemBuilder: (context, index) {
                                      Map<String, dynamic> task = taskList[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context) {
                                                  return TaskDashboard(task: task,user: projectManager,);
                                                }));
                                          },
                                          child: Container(
                                              width: 320,
                                              height: 130,
                                              decoration: BoxDecoration(
                                                color: Colors.black87,
                                                borderRadius: BorderRadius.circular(25),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsets.only(left: 12.0, top: 20),
                                                        child: Text(
                                                          task['title'],
                                                          style: const TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20,
                                                              fontFamily: 'playFair'),
                                                        ),
                                                      )),
                                                  Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsets.only(left: 12.0, top: 50),
                                                        child: Text( 'priority: '+
                                                            task['priority'],
                                                          style: const TextStyle(
                                                              color: Colors.greenAccent,
                                                              fontSize: 14,
                                                              fontFamily: 'playFair'),
                                                        ),
                                                      )),
                                                  Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsets.only(left: 12.0, top: 85),
                                                        child: Text(
                                                          'Status: '+ task['status'],
                                                          style: const TextStyle(
                                                              color: Colors.redAccent,
                                                              fontSize: 14,
                                                              fontFamily: 'playFair'),
                                                        ),
                                                      )),
                                                  const Align(
                                                    alignment: Alignment.bottomRight,
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsets.only(bottom: 8.0, right: 8.0),
                                                      child: Icon(
                                                        Icons.open_in_new,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      );
                                    });
                              }
                            }),
                      ),
                    ]
                ),
              ),
              Container(
                child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0,right: 6.0),
                        child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: TeamController.getTeams(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}'),
                                );
                              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                return const Center(
                                  child: Text('No Teams available.'),
                                );
                              }
                              else {
                                List<Map<String, dynamic>> teamList = snapshot.data!;
                                return ListView.builder(
                                    itemCount: teamList.length,
                                    itemBuilder: (context, index) {
                                      Map<String, dynamic> team = teamList[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context) {
                                                  return TeamDashboard(Team: team,);
                                                }));
                                          },
                                          child: Container(
                                              width: 320,
                                              height: 130,
                                              decoration: BoxDecoration(
                                                color: Colors.black87,
                                                borderRadius: BorderRadius.circular(25),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsets.only(left: 12.0, top: 20),
                                                        child: Text(
                                                          team['title'],
                                                          style: const TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20,
                                                              fontFamily: 'playFair'),
                                                        ),
                                                      )),
                                                  const Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsets.only(left: 12.0, top: 50),
                                                        child: Text( 'type: '+
                                                            'project',
                                                          style: TextStyle(
                                                              color: Colors.greenAccent,
                                                              fontSize: 14,
                                                              fontFamily: 'playFair'),
                                                        ),
                                                      )),
                                                  const Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsets.only(left: 12.0, top: 85),
                                                        child: Text(
                                                          'Status: '+ 'status',
                                                          style: TextStyle(
                                                              color: Colors.redAccent,
                                                              fontSize: 14,
                                                              fontFamily: 'playFair'),
                                                        ),
                                                      )),
                                                  const Align(
                                                    alignment: Alignment.bottomRight,
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsets.only(bottom: 8.0, right: 8.0),
                                                      child: Icon(
                                                        Icons.open_in_new,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      );
                                    });
                              }
                            }),
                      ),
                    ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
