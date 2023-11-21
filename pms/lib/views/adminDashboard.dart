import 'package:flutter/material.dart';
import 'package:pms/views/LoginSc.dart';
import 'package:pms/views/adminFunctionality/projectDashboard.dart';
import 'package:pms/views/adminFunctionality/taskCreation.dart';
import '../controllers/ProjectController.dart';
import 'adminFunctionality/createTeam.dart';
import 'adminFunctionality/projectCreation.dart';
import 'adminFunctionality/taskDashboard.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
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
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.black87),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                  ),
                  Text('Muhammad Waseem',style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'playFair'),),
                  Text('wyameen152@gmail.com',style: TextStyle(color: Colors.white,fontSize: 13,fontFamily: 'playFair'),),
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
              leading: const Icon(Icons.create),
              title: const Text(' Create Project '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Create Task '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Assign Task '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
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
                          future: ProjectController.getProject(),
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
                                                return ProjectDashboard(project: project);
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
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          backgroundColor: Colors.blue.shade200,
                          child: Icon(Icons.add),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const ProjectCreation();
                            }
                            ));
                          }),
                      ))
                  ]
                ),
              ),
              Container(
                child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0,right: 6.0),
                        child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: ProjectController.getProject(),
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
                                                  return ProjectDashboard(project:projectList[index]);
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
                            future: ProjectController.getProject(),
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
                                                  return const LoginSc();
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
                            }),
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FloatingActionButton(
                                backgroundColor: Colors.blue.shade200,
                                child: Icon(Icons.add),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return const CreateTeam();
                                  }
                                  ));
                                }),
                          ))
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
