import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';


void main() {
  runApp(const AttendanceTrackerApp());
}


class AttendanceTrackerApp extends StatelessWidget {

  const AttendanceTrackerApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "Smart Attendance Tracker",

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const SplashScreen(),

    );
  }
}