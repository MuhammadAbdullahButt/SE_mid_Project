import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../controllers/SignUpInController.dart';
import '../LoginSc.dart';

class PMSetPasswordScreen extends StatelessWidget {
  final String name;
  final String DOB;
  final String CNIC;
  final String role;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  PMSetPasswordScreen({required this.name,required this.DOB,required this.CNIC, required this.role});

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
                      Map PM = {
                        "name":name,
                        "DOB": DOB,
                        "CNIC":CNIC,
                        "username":usernameController.text,
                        "password":passwordController.text,
                        "role":role
                      };
                      SignUpInController.addPM(PM);
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
  }
}
