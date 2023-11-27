import 'package:flutter/material.dart';
import 'package:pms/views/adminFunctionality/projectCrScreen2.dart';
import '../../controllers/MemberController.dart';
import '../../controllers/TaskController.dart';
import '../../controllers/TeamController.dart';

class SelectPM extends StatefulWidget {
  final String name;
  final String type;
  final DateTime deadline;
  const SelectPM({
    Key? key,
    required this.name,
    required this.type,
    required this.deadline,
  }) : super(key: key);
  @override
  State<SelectPM> createState() => _SelectPMState(name,type,deadline);
}

class _SelectPMState extends State<SelectPM> {
  String name;
  String type;
  DateTime deadline;
  _SelectPMState(this.name, this.type, this.deadline);
  String selectedTeamId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Select Project Manager',style: TextStyle(color: Colors.black87,fontFamily: 'playFair'),),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            FutureBuilder<List<Map<String, dynamic>>>(
              future: MemberController.getProjectManagers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Loading indicator while waiting for data
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // Handle error state
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Data has been received, build the ListView.builder
                  List<Map<String, dynamic>>? PMList = snapshot.data;

                  return ListView.builder(
                    itemCount: PMList?.length,
                    itemBuilder: (context, index) {
                      var pm = PMList?[index];
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            const SizedBox(height: 5,),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTeamId = PMList?[index]['user_id'] ?? ""; // Update the selected team ID
                                });
                              },
                              child: Material(
                                borderRadius: BorderRadius.circular(8),
                                elevation: 2,
                                color: selectedTeamId == pm?['user_id']
                                    ? Colors.blueAccent
                                    : Colors.black87,
                                child: ListTile(
                                  title: Text(pm?['name'] ?? "", style: const TextStyle(color: Colors.white, fontFamily: 'playFair')),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ProjectCrScreenTwo(name: name,type: type,deadline: deadline,pmId: selectedTeamId,);
                        }));
                     // Task['assignedTeam_id'] = selectedTeamId;
                     // TaskController.addTask(Task);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select a Project Manager.'),
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
