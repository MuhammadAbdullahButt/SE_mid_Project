import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pms/views/SignUp/setPassword.dart';

class TechnicalInformation extends StatefulWidget {
  final String name;
  final String dob;
  final String cnic;
  const TechnicalInformation({
    Key? key,
    required this.name,
    required this.dob,
    required this.cnic,
  }) : super(key: key);
  @override
  State<TechnicalInformation> createState() => _TechnicalInformationState(name,dob,cnic);
}

class _TechnicalInformationState extends State<TechnicalInformation> {
  String name;
  String dob;
  String cnic;

  TextEditingController skillController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  _TechnicalInformationState(this.name, this.dob, this.cnic);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child:  SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 93,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(50))
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 38,left: 10),
                  child: Text("Project Management Tool",style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w700,fontFamily: 'playFair'),),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top:65.0),
                child: Text('Technical Information',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,fontFamily: 'playFairItalic'),),
              ),
              const SizedBox(height: 30,),
              Container(
                width: 325,
                child: TextField(
                  controller: skillController,
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
              const SizedBox(height: 20,),
              Container(
                width: 325,
                child: TextField(
                  controller: roleController,
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
              const SizedBox(height: 20,),
              Container(
                width: 325,
                child: TextField(
                  controller: descController,
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
              const SizedBox(height: 40,),
              Container(
                margin: EdgeInsets.only(left: 230, top: 05),
                child: Material(
                  child: FloatingActionButton(
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child:
                    const Icon(Icons.arrow_forward, color: Colors.white),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return PasswordWindow(name: name,dob: dob, cnic: cnic, skills: skillController.text,role: roleController.text,description: descController.text,);
                      }
                      ));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),

      ),

    );
  }}
