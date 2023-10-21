import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pms/views/SignUp/setPassword.dart';

class TechnicalInformation extends StatefulWidget {  @override
  State<TechnicalInformation> createState() => _TechnicalInformationState();
}

class _TechnicalInformationState extends State<TechnicalInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child:  Column(
          children: [
            Container(
              height: 93,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue.shade500,
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(50))
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 38,left: 10),
                child: Text("Project Management Tool",style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w700,fontFamily: 'playFair'),),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top:105.0),
              child: Text('Technical Information',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,fontFamily: 'playFairItalic'),),
            ),
            SizedBox(height: 40,),
            Container(
              width: 335,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white60,
                  labelText: "Skills",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: 335,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white60,
                  labelText: "Role",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: 335,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white60,
                  labelText: "write about yourself...",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            SizedBox(height: 60,),
            Container(
              margin: const EdgeInsets.only(left: 220),
              height: 60,
              width: 60,
              child: FloatingActionButton(
                backgroundColor: Colors.blue.shade500,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return PasswordWindow();
                  }));
                },
                child: const Icon(Icons.arrow_forward,color: Colors.white,),
              ),
            ),



          ],
        ),

      ),

    );
  }}
