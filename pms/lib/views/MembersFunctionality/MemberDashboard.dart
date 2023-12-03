import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../controllers/TaskController.dart';
import '../../controllers/TeamController.dart';
import '../LoginSc.dart';
import '../adminFunctionality/taskDashboard.dart';
import '../adminFunctionality/teamDashboard.dart';

class MemberDashboard extends StatefulWidget {
  Map member;
  MemberDashboard({super.key, required this.member});
  @override
  State<MemberDashboard> createState() => _MemberDashboardState(member: member);
}

class _MemberDashboardState extends State<MemberDashboard> {
  Map member;
  _MemberDashboardState({required this.member});
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
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                  ),
                  Text(member['name'].toString(),style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'playFair'),),
                  Text(member['username'].toString(),style: TextStyle(color: Colors.white,fontSize: 13,fontFamily: 'playFair'),),
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
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginSc()),
                      (route) => false, // This predicate ensures that all routes will be removed
                );
              },
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white24,
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Assigned Tasks',
                ),
                Tab(
                  text: 'My Teams',
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
                            future: TaskController.getTasksByMemberId(member['user_id']),
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
                                                  return TaskDashboard(task: task,user: member,);
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
                            future: TeamController.getTeamByMemberId(member['user_id']),
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
