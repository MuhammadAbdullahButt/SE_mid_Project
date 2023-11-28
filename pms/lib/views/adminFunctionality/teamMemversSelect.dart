import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pms/controllers/MemberController.dart';
import 'package:pms/controllers/TeamController.dart';
import 'package:pms/views/adminDashboard.dart';

class TeamMembersSelection extends StatefulWidget {
  final String teamName;
  const TeamMembersSelection({super.key, required this.teamName});
  @override
  State<TeamMembersSelection> createState() => _TeamMembersSelectionState(teamName: teamName);
}

class _TeamMembersSelectionState extends State<TeamMembersSelection> {
  final String teamName;
  _TeamMembersSelectionState({required this.teamName});
  Set<String> selectedListTiles = <String>{};
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Select team members',style: TextStyle(color: Colors.black87,fontFamily: 'playFair'),),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            FutureBuilder<List<Map<String, dynamic>>>(
              future: MemberController.getMembers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Loading indicator while waiting for data
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // Handle error state
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Data has been received, build the ListView.builder
                  List<Map<String, dynamic>>? membersList = snapshot.data;

                  return ListView.builder(
                    itemCount: membersList?.length,
                    itemBuilder: (context, index) {
                      var member = membersList?[index];
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            const SizedBox(height: 5,),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  var userId = membersList?[index]['user_id'];
                                  selectedListTiles.contains(userId) ? selectedListTiles.remove(userId) : selectedListTiles.add(userId);
                                });
                              },
                              child: Material(
                                borderRadius: BorderRadius.circular(8),
                                elevation: 2,
                                color: selectedListTiles.contains(member?['user_id']) ? Colors.blueAccent : Colors.black87,
                                child: ListTile(
                                  title: Text(member?['name'] ?? 'No Name', style: TextStyle(color: Colors.white, fontFamily: 'playFair')),
                                  trailing: Text(member?['role'] ?? 'No Role', style: TextStyle(color: Colors.white, fontFamily: 'playFair')),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Material(
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child:
                  const Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: () {
                    TeamController.createTeam(teamName, selectedListTiles);
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AdminDashboard();
                    }));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
