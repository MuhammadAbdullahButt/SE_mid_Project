import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pms/controllers/TaskController.dart';
import '../../controllers/TeamController.dart';
import '../adminDashboard.dart';

class AssignTeamSc extends StatefulWidget {
  final Map Task;
  const AssignTeamSc({super.key,required this.Task});

  @override
  State<AssignTeamSc> createState() => _AssignTeamScState(Task);
}

class _AssignTeamScState extends State<AssignTeamSc> {
  Map Task;
  _AssignTeamScState(this.Task);

  late String teamName;
  String selectedTeamId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Select team',style: TextStyle(color: Colors.black87,fontFamily: 'playFair'),),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            FutureBuilder<List<Map<String, dynamic>>>(
              future: TeamController.getTeams(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Loading indicator while waiting for data
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // Handle error state
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Data has been received, build the ListView.builder
                  List<Map<String, dynamic>>? teamList = snapshot.data;

                  return ListView.builder(
                    itemCount: teamList?.length,
                    itemBuilder: (context, index) {
                      var team = teamList?[index];
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            const SizedBox(height: 5,),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTeamId = teamList?[index]['team_id'] ?? ""; // Update the selected team ID
                                });
                              },
                              child: Material(
                                borderRadius: BorderRadius.circular(8),
                                elevation: 2,
                                color: selectedTeamId == team?['team_id']
                                    ? Colors.blueAccent
                                    : Colors.black87,
                                child: ListTile(
                                  title: Text(team?['title'] ?? "", style: const TextStyle(color: Colors.white, fontFamily: 'playFair')),
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
                    if (selectedTeamId.isNotEmpty) {
                      Task['assignedTeam_id'] = selectedTeamId;
                      TaskController.addTask(Task);
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const AdminDashboard();
                      }));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select a team.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
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
