import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../onboardingscreen.dart';

class SplashScreen extends StatefulWidget {  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return const onboardingScreen();
      }));
    }
    );
  }
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black87,
        width: double.infinity,
        height: double.infinity,
        child:  Center(
          child: Container(
            width: 150.0, // Set your desired width
            height: 150.0, // Set your desired height
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/icon.png'),
                fit: BoxFit.cover, // You can use different BoxFit values depending on your needs
              ),
            ),
          )

        ),
    );

  }}
