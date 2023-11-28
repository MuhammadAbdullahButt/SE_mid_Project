import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pms/controllers/TaskController.dart';
import 'package:pms/views/adminDashboard.dart';

import 'AssignTeamSc.dart';

class TaskCreation extends StatefulWidget {
  final Map PM;
  final Map project;
  const TaskCreation({super.key,required this.project, required this.PM});
  @override
  State<TaskCreation> createState() => _TaskCreationState(project,PM);
}

class _TaskCreationState extends State<TaskCreation> {
  final Map Project;
  final Map PM;
  Map task = {
    "Project_id":"",
    "title":"",
    "priority":"",
    "description":"",
    "status":"created",
    "deadline":"",
    "assignedTeam_id":""
  };
  _TaskCreationState(this.Project, this.PM);

  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  late String valuechoose;
  DateTime date = DateTime.now();
  List listItem = ['High', 'Medium', 'Low'];
  void initState() {
    super.initState();
    // Initialize valueChoose with the first item in the list
    valuechoose = listItem[0];
  }


  void _showDatePicker()
  {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(), firstDate: DateTime(2022), lastDate: DateTime(2030)
    ).then((value){
      setState(() {
        date = value!;
      });
    });
  }

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
                  'Create a Task',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'playFair'),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white60,
                    labelText: "Task Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 80,
                  child: TextField(
                    controller: descController,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                      decoration: InputDecoration(labelText: 'Select Priority'),
                      icon: Icon(Icons.arrow_drop_down_circle,color: Colors.black87,),
                      value: valuechoose,
                      onChanged: (newvalue) {
                        setState(() {
                          valuechoose = newvalue.toString();
                        });
                      },
                      items: listItem.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList()),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          border: Border.all(color: Colors.black87),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text("${date.day}-${date.month}-${date.year}",style: TextStyle(color: Colors.white,fontFamily: 'playFair'),)
                    ),
                    MaterialButton(
                      onPressed: (){
                        _showDatePicker();
                      },
                      child: Text('Select Deadline',style: TextStyle(color: Colors.white,fontFamily: 'playFair'),),
                      color: Colors.black87,
                    ),
                  ],),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 230, top: 50),
                  child: Material(
                    child: FloatingActionButton(
                      backgroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child:
                      const Icon(Icons.arrow_forward, color: Colors.white),
                      onPressed: () {
                        task['Project_id'] = Project['id'];
                        task['title'] = nameController.text;
                        task['description'] = descController.text;
                        task['priority'] = valuechoose;
                        task['deadline'] = date.toString();
                        task['status'] = 'created';
                        print(task);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return AssignTeamSc(Task: task, PM:PM ,);
                        })
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }}
