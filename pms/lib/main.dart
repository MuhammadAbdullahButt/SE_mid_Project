import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pms/views/PMDashboard/ProjectManagerDashboard.dart';
import 'package:pms/views/SignUp/splashScreen.dart';
import 'package:pms/views/adminDashboard.dart';
import 'package:pms/views/adminFunctionality/projectCreation.dart';

import 'check.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Management Tool',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }

}
