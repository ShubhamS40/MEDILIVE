import 'package:flutter/material.dart';
import 'package:untitled1/HospitalBedBook/HospitalBedbooking.dart';
import 'package:untitled1/HospitalBedBook/BedStatuspage.dart';
import 'package:untitled1/HospitalBedBook/HospitalConfirmationRecipt.dart';
import 'package:untitled1/HospitalBedBook/HospitalDepartment.dart';
import 'package:untitled1/HospitalBedBook/HospitalSelection.dart';
import 'package:untitled1/opd/opdConfirmationRecipt.dart';
import 'package:untitled1/opd/opdConfirmationRecipt.dart';
import 'package:untitled1/opd/previewRegistration.dart';
import 'package:untitled1/screen/adminScreen.dart';
import 'package:untitled1/screen/authScreen.dart';
import 'package:untitled1/screen/homeScreen.dart';
import 'package:untitled1/screen/welcomeScreen.dart';
import 'package:untitled1/opd/opdRegistration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Adminscreen()
    );
  }
}

