import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeamDashboard extends StatefulWidget {
  final Map Team;
  const TeamDashboard({super.key,required this.Team});
  @override
  State<TeamDashboard> createState() => _TeamDashboardState(Team: Team);
}

class _TeamDashboardState extends State<TeamDashboard> {
  Map Team;
  _TeamDashboardState({required this.Team});
  @override
  TextEditingController commentController = TextEditingController();
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
        title: Center(child: Text(Team['title'],style: TextStyle(fontSize: 30,color: Colors.white,fontFamily: 'playFairItalic'),)),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: const Column(
          children: [
            SizedBox(height: 10,),
            Text('Deadline:',style: TextStyle(color: Colors.red,fontSize: 17,fontFamily: 'playFair'),),
            SizedBox(height: 10,),
            Text('Priority: ',style: TextStyle(color: Colors.green,fontSize: 17,fontFamily: 'playFair'),),
            SizedBox(height: 10,),
            Text('Status: ',style: TextStyle(color: Colors.black87,fontSize: 17,fontFamily: 'playFair'),),
            SizedBox(height: 10,),
            Text('Description: ',style: TextStyle(color: Colors.black87,fontSize: 17,fontFamily: 'playFair'),),
            SizedBox(height: 30,),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Team 1'),
            ),
          ],
        ),
      ),
    );
  }}
