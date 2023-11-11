import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pms/views/adminDashboard.dart';

class ProjectCrScreenTwo extends StatefulWidget {
  const ProjectCrScreenTwo({super.key});
  @override
  State<ProjectCrScreenTwo> createState() => _ProjectCrScreenTwoState();
}

class _ProjectCrScreenTwoState extends State<ProjectCrScreenTwo> {
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
                  margin: EdgeInsets.only(left: 0, top: 50),
                  child: ElevatedButton(
                    onPressed: (){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: const Text('Project Created Successfully'),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                return AdminDashboard();
                              }));
                            }, child: Text('Ok')),
                          ],

                        );
                      });
                    },
                    child: Text('Create',style: TextStyle(color: Colors.white,fontFamily: 'playFair'),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87,
                    )
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }}
