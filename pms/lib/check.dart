import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pms/views/LoginSc.dart';
import 'package:pms/views/adminFunctionality/projectDashboard.dart';
import 'dart:convert';

import 'controllers/ProjectController.dart';

class ProjectListScreen extends StatefulWidget {
  @override
  _ProjectListScreenState createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends State<ProjectListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project List'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
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
        }));
  }
}

void main() {
  runApp(MaterialApp(
    home: ProjectListScreen(),
  ));
}
