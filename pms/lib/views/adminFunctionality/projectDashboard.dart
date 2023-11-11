import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectDashboard extends StatefulWidget {
  const ProjectDashboard({super.key});
  @override
  State<ProjectDashboard> createState() => _ProjectDashboardState();
}

class _ProjectDashboardState extends State<ProjectDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 170,
        backgroundColor: Colors.black87,
        shadowColor: Colors.black87,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        title: const Center(child: Text('Sudoku Game',style: TextStyle(fontSize: 30,color: Colors.white,fontFamily: 'playFairItalic'),)),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 10,),
            const Text('Deadline: 10-11-2023',style: TextStyle(color: Colors.red,fontSize: 17,fontFamily: 'playFair'),),
            const SizedBox(height: 10,),
            const Text('Est Cost: 500',style: TextStyle(color: Colors.green,fontSize: 17,fontFamily: 'playFair'),),
            const SizedBox(height: 10,),
            const Text('Status: In progress',style: TextStyle(color: Colors.black87,fontSize: 17,fontFamily: 'playFair'),),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white24,
                    bottom: const TabBar(
                      tabs: [
                        Tab(
                          text: 'Current Tasks',
                        ),
                        Tab(
                          text: 'Completed Tasks',
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      Container(
                        child: Expanded(
                          child: ListView.builder(
                              itemCount: 8,
                              itemBuilder: (context,index){
                                return Container(
                                  margin: EdgeInsets.only(top: 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                    ),
                                  ),
                                  child: const ListTile(
                                    title: Text('Task Name'),
                                  ),
                                );
                              }),
                        ),
                      ),
                      Container(
                        child: Expanded(
                          child: ListView.builder(
                              itemCount: 8,
                              itemBuilder: (context,index){
                                return Container(
                                  margin: EdgeInsets.only(top: 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                    ),
                                  ),
                                  child: const ListTile(
                                    title: Text('Task Name'),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }}
