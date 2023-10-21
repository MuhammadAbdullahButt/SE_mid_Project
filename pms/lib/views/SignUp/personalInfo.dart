import 'package:flutter/material.dart';
import 'package:pms/views/SignUp/technicalInformation.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});
  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
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
              padding: EdgeInsets.only(top:45.0),
              child: Text('Sign Up as a Development Team Member',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,fontFamily: 'playFairItalic'),),
            ),
            SizedBox(height: 100,),
            Container(
              width: 335,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white60,
                  labelText: "Name",
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
                  labelText: "Date of Birth",
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
                  labelText: "CNIC number",
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
                    return TechnicalInformation();
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
