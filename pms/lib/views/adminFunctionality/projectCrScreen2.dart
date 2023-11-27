import 'package:flutter/material.dart';
import 'package:pms/views/adminDashboard.dart';
import '../../controllers/ProjectController.dart';

class ProjectCrScreenTwo extends StatefulWidget {
  final String name;
  final String type;
  final DateTime deadline;
  final String pmId;
  const ProjectCrScreenTwo({
    Key? key,
    required this.name,
    required this.type,
    required this.deadline,
    required this.pmId
  }) : super(key: key);
  @override
  State<ProjectCrScreenTwo> createState() => _ProjectCrScreenTwoState(name,type,deadline,pmId);
}

class _ProjectCrScreenTwoState extends State<ProjectCrScreenTwo> {
  int count = 0;
  String name;
  String type;
  DateTime deadline;
  String pmId;
  _ProjectCrScreenTwoState(this.name, this.type, this.deadline, this.pmId);
  TextEditingController linkController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Map project = {
    "pm_id":"",
    "name":"",
    "type":"",
    "description":"",
    "cost":"1000",
    "status":"created",
    "repoLink":"",
    "deadLine":"",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Almost Done ...',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'playFair'),
                ),
                const SizedBox(
                  height: 60,
                ),
                TextField(
                  controller: linkController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white60,
                    labelText: "Repository Link",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 80,
                    child: TextField(
                      controller: descriptionController,
                      textInputAction: TextInputAction.newline,
                      expands: true,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white60,
                        labelText: "Description",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 130,
                  margin: const EdgeInsets.only(left: 0, top: 50),
                  child: ElevatedButton(
                    onPressed: (){
                      project['pm_id'] = pmId;
                      project['name'] = name;
                      project['type'] = type;
                      project['deadLine'] = deadline.toString();
                      project['repoLink'] = linkController.text;
                      project['description'] = descriptionController.text;
                      ProjectController.addProject(project);
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: const Text('Project Created Successfully'),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.of(context).popUntil((_) => count++ >= 4);
                            }, child: const Text('Ok')),
                          ],

                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87,
                    ),
                    child: const Text('Create',style: TextStyle(color: Colors.white,fontFamily: 'playFair'),)
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }}
