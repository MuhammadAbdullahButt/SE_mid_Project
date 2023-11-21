import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pms/views/LoginSc.dart';

import '../../controllers/MemberController.dart';

class PasswordWindow extends StatefulWidget {
  final String name;
  final String dob;
  final String cnic;
  final String skills;
  final String role;
  final String description;


  const PasswordWindow({
    Key? key,
    required this.name,
    required this.dob,
    required this.cnic,
    required this.skills,
    required this.role,
    required this.description
  }) : super(key: key);
  @override
  State<PasswordWindow> createState() => _PasswordWindowState(name,dob,cnic,skills,role,description);
}

class _PasswordWindowState extends State<PasswordWindow> {
  String name;
  String dob;
  String cnic;
  String skills;
  String role;
  String description;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  _PasswordWindowState(this.name, this.dob, this.cnic, this.skills, this.role, this.description);
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
                padding: EdgeInsets.only(top:95.0),
                child: Text('Almost Done...',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,fontFamily: 'playFairItalic'),),
              ),
              SizedBox(height: 40,),
              Container(
                width: 325,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white60,
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 325,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white60,
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Container(
                child: Material(
                  child: ElevatedButton(
                      child: Text('Create Account',style: TextStyle(color: Colors.white,fontFamily: 'playFair'),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black87,
                      ),
                    onPressed: () {
                        // send to controller function and it will add in database
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const LoginSc();
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
