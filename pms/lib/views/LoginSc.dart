import 'package:flutter/material.dart';
import 'package:pms/views/SignUp/personalInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class LoginSc extends StatefulWidget {
  const LoginSc({super.key});
  @override
  State<LoginSc> createState() => _LoginScState();
}

class _LoginScState extends State<LoginSc> {
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
                height: 360,
                decoration: BoxDecoration(
                    color: Colors.blue.shade500,
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(90))
                ),
                child: Center(child: Image(image: AssetImage('assets/images/icon.png'), width: 170, height: 170)),
              ),
              const SizedBox(height: 40,),
              const Text("Login",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold,fontFamily:'playFairItalic'),),
              const SizedBox(height: 30,),
              Container(
                width: 330,
                child: TextField(
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
                width: 330,
                child: TextField(
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
                width: 135,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade500,
                    ),
                    onPressed: () {
                      CollectionReference collref = FirebaseFirestore.instance.collection('user');
                      collref.add({
                        'username':'waseem',
                        'password':'123'
                      });
                    },
                    child: const Text("Login",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'playFair'),)

                ),
              ),
              const SizedBox(height: 30,),
              const Text("Sign up as a technical team",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400,fontFamily: 'playFair'),),
              const SizedBox(height: 5,),
              Container(
                width: 135,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade500,
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
