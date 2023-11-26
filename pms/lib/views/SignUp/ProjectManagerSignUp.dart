import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pms/controllers/SignUpInController.dart';
import 'package:pms/views/LoginSc.dart';
import 'package:pms/views/SignUp/personalInfo.dart';
import 'package:pms/views/SignUp/projectManagerPasswordSc.dart';
import 'package:pms/views/SignUp/technicalInformation.dart';

import '../adminFunctionality/projectCrScreen2.dart';

class PMSignUp extends StatefulWidget {
  const PMSignUp({super.key});
  @override
  State<PMSignUp> createState() => _PMState();
}

class _PMState extends State<PMSignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController DOBController = TextEditingController();
  TextEditingController CNICController = TextEditingController();
  DateTime? selectedDate;
  @override

  void _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ))!;

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        DOBController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
      });
    }
  }


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
                padding: EdgeInsets.only(top:45.0),
                child: Text('Sign Up as a Project Manager',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,fontFamily: 'playFairItalic'),),
              ),
              const SizedBox(height: 60,),
              Container(
                width: 325,
                child: TextField(
                  controller: nameController,
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
                width: 325,
                child: TextField(
                  controller: DOBController,
                  decoration: InputDecoration(
                    labelText: "Date of Birth",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onTap: () {
                    _selectDate(context);
                  },
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 325,
                child: TextField(
                  controller: CNICController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white60,
                    labelText: "CNIC number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 13,
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 150,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return PMSetPasswordScreen(name: nameController.text,DOB: DOBController.text,CNIC: CNICController.text,role: 'project manager',);
                      }
                      ));
                    },
                    child: const Text("Next",style: TextStyle(color: Colors.white,fontSize: 13,fontFamily: 'playFair'),)

                ),
              ),
            ],
          ),
        ),

      ),

    );
  }}
