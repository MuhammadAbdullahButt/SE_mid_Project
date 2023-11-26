import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pms/controllers/SignUpInController.dart';
import 'package:pms/views/SignUp/personalInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../controllers/ProjectController.dart';
import 'adminDashboard.dart';


class LoginSc extends StatefulWidget {
  const LoginSc({super.key});
  @override
  State<LoginSc> createState() => _LoginScState();
}

class _LoginScState extends State<LoginSc> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 270,
                decoration: const BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(70))
                ),
                child: const Center(child: Image(image: AssetImage('assets/images/icon.png'), width: 140, height: 140)),
              ),
              const SizedBox(height: 35,),
              const Text("Login",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold,fontFamily:'playFairItalic'),),
              const SizedBox(height: 25,),
              Container(
                width: 300,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white60,
                    labelText: "Enter Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                width: 300,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white60,
                    labelText: "Enter Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25,),
              Container(
                width: 120,
                height: 35,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                    ),
                    onPressed: () async {
                      Map data = {
                        "username":usernameController.text,
                        "password":passwordController.text
                      };
                      Map currentUserData = await SignUpInController.Login(data);
                      Navigator.push(context, PageTransition(child: AdminDashboard(), type: PageTransitionType.fade));
                    },
                    child: const Text("Login",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'playFair'),)

                ),
              ),
              const SizedBox(height: 30,),
              const Text("Sign up as a technical team",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400,fontFamily: 'playFair'),),
              const SizedBox(height: 5,),
              Container(
                width: 120,
                height: 35,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return PersonalInfo();
                    }
                    ));
                  },
                  child: const Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'playFair'),)

                ),
              )
            ],
          ),
        ),
      ),
    );
  }}
